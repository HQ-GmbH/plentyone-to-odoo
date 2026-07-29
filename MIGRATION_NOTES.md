# Migrationsnotizen: Plenty REST API → Odoo 19 JSON-2 API

Diese Datei verdichtet die `Migrationshinweis:`-Kommentare aus den einzelnen
Testskripten in [`plenty/`](plenty/) zu einer themensortierten Übersicht. Sie
ist die Wissensgrundlage für das geplante Migrationstool
(PlentyOne → Odoo 19 Enterprise). Für den Beleg/Quellenverweis eines
einzelnen Punkts: Testskript mit derselben Test-ID in `plenty/` öffnen.

Status-Kennzeichnung: Aussagen ohne Zusatz sind aus der offiziellen
Plenty-OpenAPI-Spec bzw. den offiziellen Guides verifiziert. Aussagen mit
**UNVERIFIZIERT** sind plausible Annahmen, die vor einer produktiven
Migration gegen eine echte Plenty-Testinstanz zu prüfen sind.

---

## 1. Authentifizierung & Sessions

| | Odoo (JSON-2) | Plenty (REST) |
|---|---|---|
| Credential | statischer API-Key | Benutzername/Passwort |
| Token | - (Key direkt als Bearer) | `POST /rest/login` → Bearer-Token, 24h gültig |
| Refresh | - | `POST /rest/login/refresh` (Body-Format **UNVERIFIZIERT**) |
| Nebenläufigkeit | unbegrenzt | i.d.R. max. 3 gleichzeitige Backend-Logins (vertragsabhängig), sonst `HTTP 429` |
| Rate Limit | - | 80-280 Lese- / 40-120 Schreibzugriffe pro User/Minute (tarifabhängig), Header `X-Plenty-*-Calls-Left` |

**Konsequenz für das Migrationstool:** Ein Token-Manager mit Refresh-Logik
und Backoff bei 429 ist Pflicht, nicht optional. Bei parallelen
Migrationsläufen den Concurrent-Session-Limit beachten (kein einfacher
Worker-Pool mit vielen gleichzeitigen Logins).

## 2. API-Mechanik allgemein (Pagination, Filter, Introspektion)

* **Pagination:** Odoo `offset`+`limit` (0-basiert) ↔ Plenty `page`+
  `itemsPerPage` (1-basiert). Umrechnung: `page = floor(offset/limit) + 1`.
* **Gesamtanzahl:** Odoo hat `search_count()`. Plenty hat keinen dedizierten
  Endpunkt dafür - die Zahl steckt im Pagination-Envelope jeder Listenantwort
  (`totalsCount`).
* **Feldauswahl:** Odoo wählt Felder gezielt aus (`fields=[...]`). Plenty
  liefert bei GET immer das komplette Objekt; Reduktion nur clientseitig.
* **Introspektion:** Odoo `fields_get()` liefert Feldmetadaten zur Laufzeit
  pro Instanz. Plenty bietet dafür **keinen Endpunkt** - einzige Quelle ist
  das statische, öffentliche OpenAPI-Schema
  (`github.com/plentymarkets/api-doc`), das zudem nicht immer mit der
  Laufzeit-Realität übereinstimmt (z.B. unvollständige Request-Schemas bei
  Contacts, siehe Abschnitt 3).
* **Aggregation:** Odoo `read_group()` hat kein Plenty-Äquivalent. Gruppierung/
  Summierung muss clientseitig erfolgen (alle Seiten laden, z.B. mit `jq`).
* **Domain-Logik:** Odoos verschachtelte UND/ODER-Domains
  (`[('a','=',1),'|',('b','=',2),('c','=',3)]`) haben bei den meisten
  Plenty-Listenendpunkten **kein** Äquivalent - Query-Parameter sind ein
  flaches, implizites UND. Ausnahme: `/rest/orders/search` erlaubt einen
  komplexeren JSON-Body mit `conditionType`/`fields`/`groups`.
* **IN/NOT IN:** Odoo `[('id','in',[1,9,15])]` hat bei den meisten Plenty-
  Ressourcen keine direkte Entsprechung (nur Einzel-ID-Filter) - muss per
  Schleife (mehrere Einzel-GETs) oder vollständigem Laden + clientseitigem
  Filtern nachgebildet werden. Relevant für die Performance-Planung bei
  großen ID-Listen.
* **Unscharfe Suche (ilike):** kein generischer Operator wie bei Odoo, aber
  einzelne Felder haben eigene "fuzzy"-Parameter, klar von "exact"-Varianten
  getrennt (z.B. Contacts: `contactEmail` vs. `email`; Variations:
  `numberFuzzy` vs. `numberExact`, `supplierNumberFuzzy` vs.
  `supplierNumber`).
* **Bulk-Import:** Odoo `load()` importiert per Spalten/Zeilen-Matrix
  (`fields`+`data`, wie CSV). Plenty hat kein direktes Äquivalent; die
  nächstliegende Bulk-Operation ist `batch_update` mit vollständigen
  Objekten. Für Massen-**Neuanlage** gibt es keinen Bulk-create-Endpunkt -
  jeder Datensatz einzeln per POST (Rate-Limits beachten!).
* **Validierung unbekannter Felder:** Odoo lehnt unbekannte Felder bei
  create()/write() typischerweise hart ab. Ob Plenty unbekannte
  JSON-Eigenschaften stillschweigend ignoriert, ist **UNVERIFIZIERT** -
  vor Massenimport-Automatisierung empirisch prüfen (Fehlklassifizierung von
  Tippfehlern in Feldnamen sonst unsichtbar).

## 3. Kontakte / Partner (`res.partner` ↔ Contact/Account/Address)

**Zentraler Befund:** Odoos `res.partner` ist ein monolithisches Modell.
Plenty verteilt dieselbe fachliche Information über **drei** Ressourcen:

| Odoo-Feld/Konzept | Plenty-Entsprechung |
|---|---|
| `name` | **nicht** am Contact - liegt auf der (primären) Adresse (`name2`/`name3`) oder am verknüpften Account (`companyName`) |
| `email` | Contact-Options-Array (`options[]`, `typeId=2`), nicht direktes Feld im Request-Body |
| `is_company` (Boolean) | kein Feld - ergibt sich daraus, ob ein Account verknüpft ist (`with=accounts`, clientseitig filtern) |
| `customer_rank`/`supplier_rank` (Integer-Rang) | fester `typeId` (1=Customer, 2=Interested party, 3=Sales representative, 4=Supplier, 5=Manufacturer, 6=Partner) - kein Rang, nur Klassifikation |
| `parent_id` (Self-Referenz) | eigene n:m-Relation `AccountContactRelation` zwischen Contact und Account, kein Self-Join |
| `active` (Soft-Delete/Archiv) | **kein Feld existiert.** `DELETE` ist vermutlich unwiderruflich (**UNVERIFIZIERT**) - Lösch-/Aufbewahrungsstrategie (z.B. DSGVO-Historie) muss neu konzipiert werden |
| `type` (invoice/delivery Adresse) | Adresstyp als Integer-ID, instanzabhängig konfigurierbar - vorher per `GET /rest/accounts/addresses/relation_types` ermitteln, nicht hart kodieren |
| `country_id`/`lang` | `lang` liegt am Contact, `country_id`-Äquivalent (`countryId`) an der Adresse - zwei Quellen statt einer |

**Konsequenz:** Ein "Partner anlegen" ist bei Plenty **mindestens ein
Zwei-Schritt-Vorgang** (Contact + Address), bei einer echten Firma sogar
drei Schritte (+ Account + Verknüpfung). Das Migrationstool braucht eine
Transaktions-/Rollback-Strategie für den Fall, dass Schritt 2 fehlschlägt,
nachdem Schritt 1 bereits einen Contact angelegt hat.

Das PUT-Schema für Contact-Updates ist zudem sehr eingeschränkt (laut
OpenAPI-Spec nur `title` und `options`) - Stammdatenänderungen laufen über
die separaten Address-Endpunkte, nicht über den Contact selbst.

## 4. Artikel / Produkte (`product.template` ↔ Item/Variation)

**Zentraler Befund:** Odoo hat ein Modell (`product.template`, optional mit
Varianten). Plenty trennt **Item** (Artikel-Stammdatensatz/"Familie") und
**Variation** (die tatsächlich verkaufbare, lagerführende Einheit mit SKU).
`product.template` entspricht eher der **Variation** als dem Item.

| Odoo-Feld | Plenty-Entsprechung |
|---|---|
| `default_code` (SKU) | `number` an der Variation |
| `list_price` | eigene Unterressource `variationSalesPrices` (1:n, z.B. je Kundengruppe/Währung) statt einzelnes Feld |
| `standard_price` | `purchasePrice` direkt an der Variation |
| `taxes_id` (Verkaufssteuer) | `vatId` an der Variation |
| `supplier_taxes_id` (Einkaufssteuer) | **kein separates Feld** - Plenty hat nur EIN vatId für Verkauf UND Einkauf |
| `uom_id` (Verkaufseinheit) | `unit` (`unitId`+`content`) an der Variation |
| `uom_po_id` (Einkaufseinheit) | **kein separates Feld** - `unitsContained`/`packingUnits` bilden Gebindegrößen ab, keine zweite Maßeinheit |
| `detailed_type` (consu/service/combo) | **andere Achse:** Plenty `itemType` unterscheidet VARIATION/ITEM_BUNDLE/BUNDLE_COMPONENT (Einzelartikel vs. Set). Kein Konzept für nicht-lagerhaltige Dienstleistungen |
| `active` (Archivierung) | `isActive` existiert **hier tatsächlich** (anders als bei Contacts, siehe Abschnitt 3 - das Fehlen ist also nicht global, sondern je Ressource unterschiedlich) |
| `categ_id` | `variationCategories`; Pflicht: jede Variation muss einer Kategorie vom Typ "Item" zugeordnet sein |

**Konsequenz:** Ein "Produkt anlegen" braucht bei Plenty typischerweise
**3+ Calls** (Item, Variation, Sales Price). Keine serverseitige Filterung
nach Steuersatz möglich (kein `vatId`-Query-Parameter) - für "alle Artikel
mit Steuersatz X" muss vollständig geladen und clientseitig gefiltert
werden.

## 5. Verkauf & Einkauf (`sale.order`/`purchase.order` ↔ Order)

**Zentraler Befund:** Plenty modelliert **sale.order UND purchase.order als
denselben Datentyp** (`Order`), unterschieden nur durch `typeId`. Odoo nutzt
zwei komplett getrennte Modelle mit eigenen States/Feldern.

Relevante `typeId`-Werte (Auszug, verifiziert aus dem Order-Schema):

| typeId | Bedeutung | Odoo-Nähe |
|---|---|---|
| 1 | Sales order | `sale.order` |
| 4 | Credit note | Gutschrift (`move_type in out_refund/in_refund`) |
| 7 | Offer | am nächsten zu `state in (draft, sent)` |
| 12 | **Reorder** (Nachbestellung) | am nächsten zu `purchase.order` |
| 15 | Redistribution (Lagerumlagerung) | kein direktes Odoo-Äquivalent |

**Es gibt keinen einzelnen "Purchase Order"-Typ** - Einkauf läuft über
Reorder (typeId=12, eigener Endpunkt `/rest/reorders`) oder Redistribution
(typeId=15). Für Reorders existiert zusätzlich ein spezialisierter
`book`-Endpunkt (`POST /rest/reorders/{id}/book`) mit vermutlicher
Geschäftslogik (Lagerbuchung) - näher an `button_confirm()` als ein reiner
Statuswechsel.

Weitere strukturelle Unterschiede:

* **Partnerverknüpfung:** kein `partner_id`-Feld - Kunde/Lieferant wird über
  ein `relations[]`-Array verknüpft (`relation: "receiver"` beim
  Verkaufsauftrag, `relation: "sender"` beim Reorder).
* **Mandant/Shop:** `plentyId` ist Pflichtfeld bei Order-Erstellung - lose
  vergleichbar mit Odoos `company_id`, aber konzeptionell verschieden
  (Odoo trennt nach rechtlicher Einheit, Plenty nach Vertriebskanal/Webshop).
* **Positionen:** `orderItems` ist ein **eingebettetes Array** im
  Order-Objekt, kein separat adressierbares Modell wie `sale.order.line`.
* **Summenfelder:** Plenty speichert **keine** `amount_total`/`amount_tax`
  auf Auftragsebene - Summen müssen aus `orderItems` (quantity × price)
  clientseitig berechnet werden.
* **Status:** GRÖSSTER Unterschied. Odoo hat 5 feste States
  (draft/sent/sale/done/cancel). Plenty nutzt ein **dezimales**,
  instanzabhängig konfigurierbares Statussystem (bis zu 199.999 mögliche
  Werte, inkl. Nachkommastellen wie `3.2`/`3.3` für Unterzustände). Ein
  einfaches `statusFrom`/`statusTo`-Range-Filter kann bei Dezimal-Substatus
  unerwartete Ergebnisse liefern. **Für das Migrationstool zwingend:** eine
  je Kundeninstanz zu verifizierende State-Mapping-Tabelle, kein hart
  kodiertes Odoo↔Plenty-Mapping.
* **Rechnungen:** Odoo `invoice_ids`/`invoice_status` verweisen auf echte
  `account.move`-Buchungsdatensätze. Plenty generiert nur ein **PDF-Dokument**
  (`POST /rest/orders/{id}/documents/invoice/generate`) ohne Buchungssatz -
  siehe Abschnitt 7.
* **Schreibbare Felder:** Das PUT-Schema für Orders erlaubt laut Spec nur
  wenige Top-Level-Felder (`addressRelations`, `lockStatus`, `orderItems`,
  `ownerId`, `plentyId`, `properties`, `relations`, `statusId`, `typeId`) -
  ein freies Referenzfeld wie `client_order_ref` existiert nicht direkt,
  am ehesten über das generische `properties[]`-Array nachbildbar.
* **Statuswechsel-Methoden (UNVERIFIZIERT):** ob ein einfaches
  `PUT .../orders/{id} {"statusId":7}` dieselben Seiteneffekte auslöst wie
  Odoos `action_confirm()`/`button_confirm()`, oder ob dafür zwingend die
  spezialisierten Endpunkte (`/rest/sales_orders/{id}/book`,
  `/rest/reorders/{id}/book`) nötig sind, ist nicht abschließend geklärt.

## 6. Lager & Bestand (`stock.*` ↔ Warehouse/Stockmanagement)

**Bester 1:1-Treffer der gesamten Recherche:** `VariationStock`
(`physicalStock`/`reservedStock`/`netStock`) über
`GET /rest/stockmanagement/warehouses/{id}/stock` entspricht praktisch exakt
Odoos `stock.quant` (`quantity`/`reserved_quantity`).

**Größter Konzeptunterschied:** Odoo hat ein **zweistufiges** Modell mit
Workflow (`stock.picking` = Transfer-Beleg mit Status
draft→waiting→assigned→done, `stock.move` = Einzelbewegung darin). Plenty
kennt **kein Belegkonzept mit Vorab-Reservierung**: Buchungen
(`bookIncomingItems`/`bookOutgoingItems`) sind **atomar und sofort final**.
Konsequenzen:

* Es gibt keine Entsprechung zu den Zwischenzuständen "reserviert/bereit"
  (`assigned`) oder "in Bearbeitung" - jede Bewegung in `stock/movements`
  ist per Definition bereits `done`.
* Es gibt kein "Storno" einer bereits gebuchten Bewegung - Korrekturen
  laufen ausschließlich über eine **Gegenbuchung**
  (`PUT .../stock/correction`, z.B. `reasonId=106` "Maculation canceled"),
  nie über ein echtes Löschen der ursprünglichen Buchung.
* `stock.picking` (Beleg) und `stock.move` (Bewegung darin) sind bei Odoo
  zwei Modelle - Plenty hat nur **ein** Konzept (`stock/movements`), mit
  einem feingranularen Katalog von `reasonId`-Werten (11 Werte allein für
  Wareneingänge, z.B. 101=Incoming items, 180=Incoming items/purchase
  order, 181=Incoming items/warehousing) statt eines generischen
  `picking_type_code`.
* Odoos `stock.location`-Baum ist eine generisch beliebig tiefe
  Baumstruktur (Firma > Lager > Zone > Regal > Fach) als eigenes Modell.
  Plenty modelliert Lagerplätze als feste Struktur (Dimensionen/Ebenen)
  **unterhalb** eines Warehouse, nicht als generischer Location-Baum.
* Odoos `stock.picking.type` definiert **Operationen** (eingehend/ausgehend/
  intern) innerhalb eines Lagers. Plenty's `Warehouse.typeId` (0=Sales,
  1=Repair, 4=Storage, 5=Transit, 6=Distribution, 7=Other) beschreibt
  stattdessen den **Zweck des Lagers selbst** - keine echte Entsprechung,
  nur die naheliegendste Klassifikation.
* Interne Umlagerungen laufen über `PUT /rest/stockmanagement/stock/
  redistribute` bzw. den Order-Typ "Redistribution" (typeId=15) - exaktes
  Feldschema **UNVERIFIZIERT**.

## 7. Buchhaltung (`account.*`) - größte strukturelle Lücke

**Zentraler Befund (systematisch gegen alle 1199 Pfade der OpenAPI-Spec
geprüft):** Es gibt **kein** Äquivalent zu `account.move`/`account.journal`.
Keine Treffer für "journal" oder "ledger" im gesamten Schema. Was existiert:

| Vorhanden bei Plenty | Deckt ab | Deckt NICHT ab |
|---|---|---|
| `/rest/payments` | Zahlungsereignisse (amount/currency/type/status/mopId) | Buchungssätze, Soll/Haben |
| `/rest/vat` | Steuersätze je Land (~`account.tax`) | - (guter direkter Treffer) |
| `/rest/orders/{id}/documents/invoice/generate` | Rechnung als **PDF** | Buchhaltungsdatensatz dahinter |
| `/rest/orders?orderType=4` | Gutschriften als Auftragstyp | Buchungssatz dahinter |
| `/rest/accounting/locations/posting_accounts` | Konto-**Export-Mapping** (z.B. für DATEV) | echten Kontenplan mit Salden |
| `/rest/payments/methods` | Zahlungsarten-Stammdaten | Bankjournal/Kontostand |

**Ohne jede Entsprechung:** `account.move.line` (Buchungszeilen),
`account.journal` (Verkaufs-/Einkaufs-/Bankjournal), Debitoren-/
Kreditorenkonten mit laufendem Saldo (`account_type=asset_receivable`/
`liability_payable`), Vendor Bills (Eingangsrechnungen mit Fälligkeit).

**Konsequenz für das Migrationstool - die wichtigste Einzelerkenntnis
dieser Recherche:** Plenty ist **kein** Buchhaltungssystem. In der
Praxis wird Buchhaltung extern (DATEV, lexoffice, o.ä.) geführt; Plenty
liefert dafür nur Export-Konfiguration und Rohdaten (Zahlungen, VAT,
PDF-Dokumente). Eine Odoo→Plenty- oder Plenty→Odoo-Migration der
G-Serie-Daten ist **kein 1:1-Feldmapping-Problem**, sondern erfordert eine
Entscheidung, ob/wie ein externes Buchhaltungssystem in die Migration
einbezogen wird. Odoo-Buchhaltungsdaten lassen sich nicht "nach Plenty"
migrieren, weil es dort keinen Zielort dafür gibt.

## 8. Offene Punkte für weitere Recherche

* Exaktes Body-Format von `POST /rest/login/refresh`.
* Generisches Fehler-Body-Schema für 400/401/404/422 (nur ein einziges
  429-Beispiel offiziell belegt).
* Verhalten bei unbekannten JSON-Feldern in create()/write()-Bodies.
* Konkrete Adresstyp-IDs für Rechnungs-/Lieferadresse (instanzabhängig,
  per `GET /rest/accounts/addresses/relation_types` zu ermitteln).
* Exaktes Feldschema von `PUT /rest/stockmanagement/stock/redistribute`.
* Ob `PUT /rest/orders/{id} {"statusId":...}` dieselben Seiteneffekte hat
  wie die spezialisierten `book`-Endpunkte.
* Detailstruktur der "4 VAT-Sätze" pro Land im `/rest/vat`-Datensatz.

## Quellen

* Offizielles OpenAPI-v3-Schema: `github.com/plentymarkets/api-doc`
  (`plentymarkets/openApiV3/openApiV3.json`)
* `developers.plentymarkets.com/en-gb/developers/main/rest-api-guides/*`
  (Getting Started, Contact Data, Item Data, Order Data, Order Search,
  Purchase Orders, Bulk Routes)
* `knowledge.plentyone.com/de-de/manual/main/auftraege/order-statuses.html`
