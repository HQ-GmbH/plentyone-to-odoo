# Migrationsnotizen: Odoo 19 JSON-2 API ↔ Plenty REST API ↔ Shopware 6.7 Admin API

Diese Datei verdichtet die `Migrationshinweis:`-Kommentare aus den einzelnen
Testskripten in [`plenty/`](plenty/) und [`shopware/`](shopware/) zu einer
themensortierten Übersicht. Sie ist die Wissensgrundlage für das geplante
Migrationstool (PlentyOne → Odoo 19 Enterprise, mit Shopware als drittem
Vergleichspunkt). Für den Beleg/Quellenverweis eines einzelnen Punkts: das
Testskript mit derselben Test-ID im jeweiligen Ordner öffnen.

Status-Kennzeichnung: Aussagen ohne Zusatz sind aus der jeweiligen offiziellen
OpenAPI-Spec bzw. den offiziellen Guides verifiziert. Aussagen mit
**UNVERIFIZIERT** sind plausible Annahmen, die vor einer produktiven
Migration gegen eine echte Test-Instanz zu prüfen sind.

**Teil A (Abschnitte 1-8) behandelt Plenty ↔ Odoo. Teil B (Abschnitte 9-16)
behandelt Shopware ↔ Odoo/Plenty.**

---

# Teil A: Plenty REST API ↔ Odoo

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

## Quellen (Teil A)

* Offizielles OpenAPI-v3-Schema: `github.com/plentymarkets/api-doc`
  (`plentymarkets/openApiV3/openApiV3.json`)
* `developers.plentymarkets.com/en-gb/developers/main/rest-api-guides/*`
  (Getting Started, Contact Data, Item Data, Order Data, Order Search,
  Purchase Orders, Bulk Routes)
* `knowledge.plentyone.com/de-de/manual/main/auftraege/order-statuses.html`

---

# Teil B: Shopware 6.7 Admin API ↔ Odoo/Plenty

Quelle fürs Schema: offizielles OpenAPI-v3-Dokument, direkt vom
`shopware/admin-api-reference`-GitHub-Repo (`latest`-Branch, `info.version`
= `6.7.12.1`) sowie live per `GET /api/_info/openapi3.json` von jeder
Shopware-Instanz selbst abrufbar. Zusätzlich zum Abgleich herangezogen: das
Schema mit aktiviertem kostenpflichtigem Commercial-Plugin
(`SwagCommercial-adminapi.json`, `6.7.9.0`).

## 9. Authentifizierung & Sessions

| | Odoo (JSON-2) | Plenty (REST) | Shopware (Admin API) |
|---|---|---|---|
| Credential | statischer API-Key | Benutzername/Passwort | Integration (Client-ID/Secret) |
| Token | - (Key direkt als Bearer) | `POST /rest/login` → 24h | `POST /api/oauth/token` (`client_credentials`) → **nur 600s (10 Min.)** |
| Refresh | - | `POST /rest/login/refresh` | keins bei `client_credentials` - einfach neu anfragen |
| Fehlerformat | eigenes | `{"error","message"}` (nur 1 Beispiel belegt) | vollständiges **JSON:API**-Format (`{"errors":[{"status","title","detail",...}]}`), für beide Content-Types identisch |

**Konsequenz:** Shopwares Token ist mit 10 Minuten der kürzeste der drei APIs
(Plenty: 24h, Odoo: kein Ablauf). Ein Migrationstool muss den Token praktisch
bei jedem längeren Batch-Job neu anfordern, nicht nur gelegentlich auffrischen.
Positiv: Shopwares Fehlerformat ist das einzige der drei APIs, das im Schema
selbst vollständig spezifiziert ist.

## 10. API-Mechanik allgemein - Shopwares Criteria-System ist der beste Treffer der ganzen Recherche

Shopwares generisches `POST /api/search/{entity}`-Muster (Criteria-Objekt mit
`filter`/`sort`/`page`/`limit`/`associations`/`fields`/`total-count-mode`)
kommt Odoos ORM-Semantik **deutlich näher** als Plentys flache
Query-Parameter:

| Odoo-Konzept | Plenty | Shopware |
|---|---|---|
| `fields=[...]` (Sparse Fieldset) | nicht möglich, immer volles Objekt | **möglich** über `"fields":[...]` im Criteria-Body |
| `order=` (Sortierung) | nicht möglich (bei Contacts) | **möglich**, serverseitig, für praktisch jedes Feld |
| Domain `[('id','in',[...])]` | nicht möglich, nur Einzel-ID | **möglich** über `{"type":"equalsAny",...}` |
| Domain `not in` | nicht möglich | **möglich** über `{"type":"not","queries":[...]}` |
| Domain `'|'`/`'&'`-Verschachtelung | nicht möglich | **möglich** über `{"type":"multi","operator":"and"/"or"/"nand"/"nor"}` |
| `ilike` (generisch, jedes Feld) | nur einzelne Felder haben fuzzy-Varianten (z.B. `contactEmail`) | **generisch** über `{"type":"contains",...}` auf jedem String-Feld |
| `read_group()` | **kein Äquivalent** | **`POST /api/aggregate/{entity}`** mit `terms` (group-by) + `count`/`sum`/`avg`/`min`/`max`/`stats` |
| Verschachtelte Prefetches | `?with=...` (flach) | `"associations":{...}` (rekursiv verschachtelbar, mit eigenen Filtern je Assoziation) |
| `search_count()` | `totalsCount` im Envelope (immer vorhanden) | `"total-count-mode":"exact"` explizit anfordern (Performance-Trade-off per Default deaktiviert) |

**Wichtiger Kuriositäten-Fund:** `POST`/`PATCH` liefern bei Shopware per
Default **gar keinen Response-Body** - nur mit `?_response=detail` (oder
`basic`) wird die erzeugte/geänderte Ressource zurückgegeben. Leicht zu
übersehen, wenn man Odoo/Plenty-Gewohnheiten (Antwort kommt immer mit)
überträgt.

**Weiterer Unterschied:** Shopware-IDs sind **UUIDs** (36-Zeichen-Strings),
nicht Integer wie bei Odoo/Plenty. Ein Migrationstool braucht für Shopware
zwingend eine externe ID-Zuordnungstabelle (Odoo/Plenty-Integer ↔
Shopware-UUID) - kein direktes numerisches Mapping möglich.

**Bulk-Import:** `POST /api/_action/sync` mit `action":"upsert"` ist ein
echtes Upsert (Create ODER Update in einem Call, mehrere Entities gemischt
möglich) - kommt Odoos `load()` näher als Plentys `batch_update` (das nur
Updates kann, kein Bulk-Create).

## 11. Kontakte / Partner (`res.partner` ↔ `customer`/`customer-address`)

Anders als bei Plenty (Contact+Account+Address über drei Ressourcen verteilt)
ist Shopwares `customer`-Entity dem Odoo-Modell in mancher Hinsicht näher,
in anderer Hinsicht weiter entfernt:

| Aspekt | Odoo | Plenty | Shopware |
|---|---|---|---|
| Name/E-Mail direkt am Hauptobjekt | ja | nein (Options-Array/Adresse) | **ja** (`firstName`/`lastName`/`email` direkte Felder) |
| Aktiv/Archiviert-Flag | ja (`active`) | **nein** | **ja** (`active`) |
| Verschachtelter Write (Kontakt+Adresse in einem Call) | ja (ein Modell) | nein (zwingend 2 Calls) | **ja** (Client vergibt eigene UUIDs, referenziert sie im selben Payload) |
| Kunde/Lieferant in derselben Tabelle | ja (`customer_rank`/`supplier_rank`) | ja (`typeId`) | **nein** - `customer` ist AUSSCHLIESSLICH Kunden; kein Lieferantenkonzept überhaupt |
| Eltern-Kind-Beziehung (Firma → Ansprechpartner) | ja (`parent_id`) | ja (Account↔Contact-Relation) | **nein** - nur ein Freitextfeld `company`, keine strukturelle Verknüpfung |
| Adresstyp (Rechnung/Lieferung) | String-Feld am Adressdatensatz | konfigurierbare Integer-ID | **kein Typ an der Adresse selbst** - `defaultBillingAddressId`/`defaultShippingAddressId` referenzieren stattdessen vom Customer aus |

**Wichtigste Einzelerkenntnis:** Shopware **invertiert** das bei Plenty
beobachtete Problem. Bei Plenty/Odoo muss "nur Kunden" erst aus einer
gemischten Tabelle herausgefiltert werden (Rang/typeId). Bei Shopware ist die
Trennung bereits strukturell vorgegeben (`customer` = ausschließlich Kunden) -
dafür fehlt umgekehrt jedes Konzept für Lieferanten komplett (0 Treffer für
`vendor`/`supplier` in 665 Pfaden). `product-manufacturer` ist reine
Marken-/Marketinginfo, kein Adress-/Einkaufskonzept.

Ein per Admin-API angelegter Auftrag speichert übrigens einen **Snapshot**
der Kundendaten zum Bestellzeitpunkt (`order-customer`), keine reine
Fremdschlüssel-Referenz - spätere Adressänderungen am Kunden wirken sich NICHT
rückwirkend auf vergangene Aufträge aus (anders zu erwarten, wenn man von
Odoo/Plenty-FK-Semantik ausgeht).

## 12. Artikel / Produkte (`product.template` ↔ `product`)

Shopwares `product`-Entity ist (anders als Plentys Item+Variation-Trennung)
ein einzelnes Modell für sowohl eigenständige Produkte als auch Varianten
(über `parentId`/`children`) - näher an Odoos Struktur.

| Odoo-Feld | Shopware-Entsprechung |
|---|---|
| `default_code` (SKU) | `productNumber` |
| `list_price` | `price` - **Array** von Preisobjekten (ein Eintrag je Währung), speichert **gross UND net gleichzeitig** (kein einzelner Preis mit implizit abgeleitetem Steuersatz) |
| `standard_price` | `purchasePrices` (ebenfalls ein Price-Array, "Actual/cost price") |
| `taxes_id`/`supplier_taxes_id` | nur EIN `taxId`-Feld - keine getrennte Einkaufssteuer (identische Lücke wie bei Plenty) |
| `uom_id`/`uom_po_id` | nur EIN `unitId`-Feld; `purchaseUnit`/`referenceUnit` sind **keine zweite Masseinheit**, sondern numerische Mengenangaben für die Grundpreisanzeige (z.B. "Preis pro 100ml" nach PAngV) - leicht mit einer echten Einkaufseinheit zu verwechseln |
| `detailed_type` (consu/service/combo) | **kein Feld dafür** - keine Achse Ware/Dienstleistung am Produkt überhaupt |
| `active` | `active` (direkter Treffer) |
| Verfügbarer Bestand (`virtual_available`) | `availableStock` (readOnly, = `stock` minus offene Bestellungen) |

**Fazit:** Die Produktseite ist bei Shopware insgesamt die am saubersten
übertragbare Entität der ganzen Drei-API-Recherche (neben `tax`/`vat`).

## 13. Bestellungen (`sale.order` ↔ `order`) - drei getrennte State-Maschinen

**Zentraler Unterschied zu Odoo UND Plenty:** Shopware hat **keinen**
einheitlichen Auftragsstatus, sondern **drei unabhängige State-Maschinen**
auf drei verschiedenen Entities:

* `order.state` (Gesamtstatus: `open`/`in_progress`/`cancelled`/`completed`)
* `order_transaction.state` (Zahlungsstatus, u.a. `open`/`paid`/`paid_partially`/`refunded`/`cancelled`)
* `order_delivery.state` (Lieferstatus, u.a. `open`/`shipped`/`shipped_partially`/`returned`)

Odoos einzelnes `invoice_status`-Feld am `sale.order` entspricht damit am
ehesten `order_transaction.state`, ist aber strukturell getrennt vom
Hauptstatus - keine Zusammenfassung in einem Feld wie bei Odoo.

**`stateId` ist eine instanzabhängige UUID, kein Enum-Wert!** Anders als
Odoos feste String-Enums oder Plentys numerisches Statussystem verweist
`stateId` auf einen Datensatz in der `state_machine_state`-Tabelle - der
konkrete UUID-Wert ist PRO INSTANZ unterschiedlich. Robuster Filteransatz:
über die Assoziation nach `stateMachineState.technicalName` filtern statt
eine `stateId`-UUID hart zu kodieren (**UNVERIFIZIERT**, aber nach dem
allgemeinen Shopware-DAL-Muster technisch plausibel).

Statusübergänge laufen über eigene Aktions-Endpunkte:
`POST /api/_action/order/{id}/state/{transition}` (und analog für
`order_transaction`/`order_delivery`). Die exakten `technicalName`-Werte der
Standard-Transitions (z.B. `process`, `cancel`) sind **UNVERIFIZIERT** - im
Schema selbst nicht als Enum hinterlegt; vor Nutzung per
`GET /api/_action/order/{id}/state` die für den konkreten Auftrag verfügbaren
Transitions abfragen.

**Weitere Unterschiede:**

* `amountNet`/`amountTotal` sind **gespeicherte** Felder direkt am Order
  (anders als bei Plenty, wo die Summe aus `orderItems` berechnet werden
  muss) - näher an Odoo.
* `order-line-item` ist eine **eigene, separat adressierbare Entity** mit
  eigenem Suchendpunkt (anders als Plentys eingebettetes `orderItems`-Array) -
  näher an Odoos `sale.order.line`.
* Der Kunde ist NICHT direkt am Order-Objekt (kein `customerId`-Feld dort),
  sondern über die separate `order-customer`-Assoziation verknüpft (Snapshot,
  siehe Abschnitt 11).
* Auftragserstellung per Admin-API ist **unüblich und aufwendig**: Pflichtfelder
  wie `itemRounding`/`totalRounding` (Rundungskonfiguration) und die
  instanzabhängige `stateId` machen einen direkten POST auf `/api/order`
  komplizierter als bei Odoo/Plenty. In der Praxis entstehen Shopware-Aufträge
  über die Store-API/den Checkout-Flow, nicht über die Admin-API.
* Rechnungen/Gutschriften sind wie bei Plenty nur **PDF-Dokumente**
  (`document`-Entity, `documentType` u.a. `invoice`/`credit_note`/
  `delivery_note`) ohne Buchungssatz dahinter.
* `salesChannelId` ist die dritte, eigenständige Auspraegung der "wie bilde
  ich Mandanten/Unternehmen ab"-Frage (Odoo: `company_id` = rechtliche
  Einheit; Plenty: `plentyId` = Webshop; Shopware: `salesChannelId` =
  Vertriebskanal).

## 14. Lager & Bestand - deutlich weniger als bei Plenty

Der größte Rückschritt gegenüber Plenty: Shopware Core kennt **nur ein
einzelnes `stock`-Integer-Feld pro Produkt** - keine Bestandsbewegungshistorie,
kein Beleg-/Picking-Konzept, keine Lagerorte.

**Bemerkenswerter Schema-Fund:** Die Entity-Definitionen `Warehouse`,
`WarehouseGroup`, `ProductWarehouse`, `OrderProductWarehouse` existieren
bereits im Core-Schema - aber **ohne zugehörige HTTP-Pfade** und ohne jede
Verknüpfung vom `Product`-Schema aus. Im Schema mit aktiviertem
(kostenpflichtigem) Commercial-Plugin sind exakt dieselben Entities voll
ausgestattet (`/api/warehouse` etc.). **Multi-Warehouse/"Advanced Inventory"
ist damit ein reines Feature des kostenpflichtigen Shopware-Commercial-Plugins,
nicht des Open-Source-Cores** - das ist keine Vermutung, sondern direkt aus
dem Schema-Vergleich abgeleitet (siehe `shopware/F001-*.sh`, `F003-*.sh`).

| Odoo/Plenty-Konzept | Shopware Core |
|---|---|
| `stock.quant`/`VariationStock` (Bestand je Lager) | nur ein globaler `stock`-Wert je Produkt, keine Lageraufschlüsselung |
| `virtual_available`/`netStock` | `availableStock` (readOnly, = stock minus offene Bestellungen) - der einzige echte Treffer |
| `stock.picking`/Bestandsbewegungen | **kein Äquivalent** - keine Bewegungshistorie überhaupt |
| Inkrementelles Buchen ("+5 Stück") | **nicht möglich** - nur PATCH des absoluten `stock`-Werts, Lost-Update-Risiko bei paralleler Änderung |
| `stock.location`-Baum | **kein Äquivalent** (ohne Commercial-Plugin) |
| `stock.picking.type` | **kein Äquivalent** |

**Konsequenz für das Migrationstool:** Wer Odoo/Plenty-Mehrlagerdaten nach
Shopware migrieren will, braucht entweder das kostenpflichtige
Commercial-Plugin oder muss auf den einfachen globalen `stock`-Wert
reduzieren (Informationsverlust).

## 15. Buchhaltung - noch weniger als bei Plenty

Bestätigt (alle 419 Schema-Namen durchsucht): **kein** Journal-/Buchungssatz-
Modell, **keine** Vendor-Bills (folgt aus dem fehlenden Lieferantenkonzept,
Abschnitt 11), und - anders als Plenty - **auch keine
Buchhaltungs-Export-Konfiguration** (Plenty hat immerhin
`/rest/accounting/locations/posting_accounts` für ein DATEV-artiges Mapping;
bei Shopware Core fehlt selbst das komplett).

| Vorhanden bei Shopware | Deckt ab | Deckt NICHT ab |
|---|---|---|
| `order-transaction` | Zahlungsvorgang (Betrag/Status/Zahlungsmethode) | Buchungssatz, Konten |
| `tax` | Steuersätze (`taxRate`, `name`) - direkter Treffer, wie Plentys `vat` | Kontenplan |
| `document` (`invoice`/`credit_note`/...) | Rechnung/Gutschrift als **PDF** | Buchungssatz dahinter |
| `payment-method` | Zahlungsarten-Stammdaten | Bankjournal/Kontostand |

**Fazit:** Buchhaltung ist bei Shopware eine noch klarere Fremdaufgabe als bei
Plenty - üblicherweise übernehmen Drittanbieter-Plugins (z.B. für
DATEV-Export) diese Aufgabe komplett außerhalb des Cores, ohne dass der Core
dafür überhaupt eine Konfigurationsstruktur mitbringt.

## 16. Offene Punkte für weitere Recherche (Shopware)

* Exakte `technicalName`-Werte der Standard-Transitions für `order`/
  `order_transaction`/`order_delivery` (z.B. `process`, `cancel`) - im Schema
  nicht als Enum hinterlegt, nur empirisch per
  `GET /api/_action/order/{id}/state` zu ermitteln.
* Konkrete `accountType`-Enum-Werte am Customer (vermutlich `private`/
  `business`, im Schema nicht als Enum dokumentiert).
* Verhalten bei unbekannten JSON-Feldern in `POST`/`PATCH`-Bodies (strikt
  abgelehnt oder stillschweigend ignoriert?).
* Ob `stateMachineState.technicalName` als Assoziations-Filterpfad exakt so
  funktioniert wie angenommen (D009/G007-G009 in `shopware/`).
* Ob dokumentierte Rate-Limits existieren (im Schema nur eine
  429-Fehlerkomponente ohne Verknüpfung an einem konkreten Endpunkt - deutet
  auf "nicht offiziell dokumentiert", nicht zwingend "nicht vorhanden").

## Quellen (Teil B)

* Offizielles OpenAPI-v3-Schema: `github.com/shopware/admin-api-reference`
  (`latest`-Branch, entspricht `6.7.12.1`) sowie live per
  `GET /api/_info/openapi3.json` jeder Shopware-Instanz
* Schema mit Commercial-Plugin zum Abgleich: `SwagCommercial-adminapi.json`
  (`6.7.9.0`)
* `developer.shopware.com/docs/guides/development/integrations-api/*`
  (Auth/Rate-Limits/Pagination)
* `developer.shopware.com/docs/guides/plugins/plugins/checkout/order/using-the-state-machine.html`
  (Standard-Zustände der drei Order-State-Maschinen)
