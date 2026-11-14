# Odoo 20 JSON-2 API Reference Tests

Referenzimplementierungen der Odoo 20 JSON-2 API, übernommen aus
[`../odoo-v19`](../odoo-v19). Format der Anfragen und Header wurden gegen einen
lokalen Mock-Server geprüft; **ein Test gegen eine reale Odoo-20-Instanz steht
noch aus**. Grundlage des *Technischen Referenzwerks: PlentyONE → Odoo 19 mit
Shopware 6* - siehe [`../README.md`](../README.md) für den Gesamtkontext und
[`../MIGRATION_NOTES.md`](../MIGRATION_NOTES.md) für die Migrationshinweise.

Gegenstücke mit identischen Test-IDs liegen in [`../plenty`](../plenty) und
[`../shopware`](../shopware).

## Voraussetzungen

`../config.sh` (Vorlage: [`../config/config.example.sh`](../config/config.example.sh))
muss setzen:

```bash
export ODOO_URL="https://dein-odoo-host"
export ODOO_API_KEY="dein-api-key"
# Optional, nur wenn mehrere Datenbanken über denselben Host laufen:
export ODOO_DATABASE="dein-datenbankname"
```

Die Serien **H**, **I** und **J** testen die Infrastruktur hinter einer
selbstgehosteten Installation (RabbitMQ, Checkmk, Prometheus) und benötigen
zusätzlich `RABBITMQ_*`, `CHECKMK_*` bzw. `PROMETHEUS_URL`.

## Ausführung

Die Skripte laden `../config.sh` und `_json2_common.sh` relativ zu ihrem
eigenen Ordner und lassen sich aus jedem Verzeichnis starten:

```bash
./odoo-v20/A005-search_read.sh
```

Skripte, die einzelne Datensätze lesen, ändern oder löschen, erwarten die ID
als Umgebungsvariable, zum Beispiel:

```bash
PARTNER_ID=123 ./odoo-v20/B003-partner-read.sh
```

IDs, `LIMIT` und `OFFSET` müssen ganze Zahlen sein; Suchwerte wie
`DEFAULT_CODE` werden als JSON-String kodiert. Bei ungültigen Werten bricht das
Skript ab, bevor eine Anfrage gesendet wird. Schreib- und Löschtests nur mit
Testdaten ausführen.

## Vor dem ersten Lauf gegen Odoo 20 prüfen

* **A023 `read_group`:** ob die Methode noch öffentlich aufrufbar ist oder durch
  `formatted_read_group` ersetzt werden muss.
* **C016 `uom_po_id`:** ob das Feld noch existiert (z. B. mit C006 / `fields_get`).
* **A024 `search_fetch`:** JSON-2 liefert Recordsets als ID-Liste; Feldwerte
  sind im Ergebnis voraussichtlich nicht enthalten.

## Review

Die Skripte in diesem Ordner wurden durchgesehen von
[**Mathias Goldhan**](https://www.hqgmbh.de/autoren/mathias-goldhan/),
Enterprise-Architekt der [HQ GmbH](https://www.hqgmbh.de/)
(siehe `Reviewed by:` im Kommentarkopf jedes Skripts).
