# Shopware 6.7 Admin API Reference Tests

Drittes Gegenstück (nach [`../odoo-v19`](../odoo-v19)/[`../odoo-v20`](../odoo-v20) und [`../plenty`](../plenty)) -
dieselben Test-IDs, dieselbe Struktur, aber gegen die Shopware 6.7 Admin API.

## Voraussetzungen

* Eine Shopware-6.7-Integration (Administration → Einstellungen → System →
  Integrationen) mit Client-ID/Client-Secret
* `curl` >= 8.x
* `jq`
* `uuidgen` (Teil von util-linux/macOS-Bordmitteln) für Skripte, die eigene
  Client-Side-UUIDs vergeben (z.B. `A011-create.sh`, `B002-partner-create.sh`)

`../config.sh` muss zusätzlich zu den ODOO_*/PLENTY_*-Variablen setzen:

```bash
export SHOPWARE_URL="https://shop.example.com"
export SHOPWARE_CLIENT_ID="SWIAxxxxxxxxxxxxxxxxxxxxxxxx"
export SHOPWARE_CLIENT_SECRET="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
```

## Ausführung

Wie bei `../plenty`: aus diesem Verzeichnis heraus ausführen.

```bash
cd shopware
./A005-search_read.sh
```

`_login.sh` wird von (fast) jedem Testskript per `source` eingebunden und holt
per OAuth2 `client_credentials`-Grant einen Bearer-Token
(`POST /api/oauth/token`). **Der Token ist nur 600 Sekunden (10 Minuten)
gültig** - deutlich kürzer als bei Odoo (kein Ablauf) oder Plenty (24h). Es
gibt beim `client_credentials`-Grant kein Refresh-Token; `_login.sh` holt bei
jedem Skriptlauf einfach einen frischen Token.

## Warum nicht alle Odoo-Skripte eine (volle) Entsprechung haben

* **Serien H (RabbitMQ), I (Checkmk), J (Prometheus)** aus `../odoo-v19` bzw. `../odoo-v20` fehlen
  hier aus demselben Grund wie bei `../plenty`: sie testen Infrastruktur
  hinter einer selbstgehosteten Odoo-Installation, keine Shop-/ERP-API.
* **Serie E (Einkauf)** ist komplett `GAP`: Shopware Core hat kein
  Lieferanten-/Beschaffungskonzept jeglicher Art. Shopware ist eine
  Checkout-/Shopsoftware, kein ERP mit Einkaufsseite.
* **Serie F (Lager)** ist überwiegend `GAP`: im Core existiert nur ein
  einzelnes `stock`-Feld pro Produkt. Mehrlagerverwaltung
  (`Warehouse`/`ProductWarehouse`-Schemas existieren bereits, aber ohne
  HTTP-Pfade) ist ein Feature des kostenpflichtigen Commercial-Plugins.
* **Serie G (Buchhaltung)** ist überwiegend `GAP` - sogar stärker als bei
  Plenty, da nicht einmal eine Buchhaltungs-Export-Konfiguration (wie
  Plentys DATEV-Mapping) im Core existiert.

Alle A-G-Serien haben trotzdem ein 1:1 benanntes Gegenstück in diesem Ordner -
auch dort, wo es kein echtes Äquivalent gibt (`GAP:`-Hinweis statt API-Call).

## Migrationshinweise

Wie bei `plenty/`: jedes Skript mit einer strukturellen Abweichung von seinem
Odoo-Pendant enthält im Kommentarkopf einen `Migrationshinweis:`-Abschnitt.
Siehe [`../MIGRATION_NOTES.md`](../MIGRATION_NOTES.md) für die verdichtete
Zusammenfassung.

## Geprüfte Annahmen

Einige Details sind im OpenAPI-Schema nicht als Enum oder Validierungsregel
hinterlegt und mussten deshalb gegen die Instanz geklärt werden - die Skripte
verwenden inzwischen die geprüften Werte und erklären sie im Kommentarkopf:

* der `technicalName` der Standard-State-Transitions (`process` für
  `open`→`in_progress`, siehe D013) - der Pfad nimmt `{transition}` als freien
  String, gültige Namen stehen nicht im Schema
* die `accountType`-Werte `business` und `private` (siehe B008/B009) - die
  Feldbeschreibung im Schema formuliert unpräzise "personal or business",
  der tatsächliche Wert für Privatkunden ist `private`
* Filtern per Punkt-Pfad durch eine Assoziation
  (`stateMachineState.technicalName`, siehe D009/G007) statt über eine
  instanzabhängige `stateId`-UUID

Weil die State-Maschine je Instanz erweiterbar ist, sollte ein Migrationstool
die verfügbaren Transitions trotzdem zur Laufzeit abfragen — über
`GET /api/_action/state-machine/order/{orderId}/state`. Achtung: ein `GET` auf
`/api/_action/order/{orderId}/state` gibt es **nicht**, dieser Pfad kennt nur
`POST` mit `{transition}`.

## Review

Die Skripte in diesem Ordner wurden durchgesehen von
[**Christopher Einenkel**](https://www.hqgmbh.de/autoren/christopher-einenkel/),
Senior Integration Architect & API Specialist der
[HQ GmbH](https://www.hqgmbh.de/) (siehe `Reviewed by:` im Kommentarkopf jedes
Skripts) und gegen eine echte Shopware-Instanz getestet.
