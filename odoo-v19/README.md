# Odoo 19 JSON-2 API Reference Tests

Referenzimplementierungen der Odoo 19 JSON-2 API, getestet gegen eine reale
Odoo-19-Instanz. Grundlage des *Technischen Referenzwerks: PlentyONE → Odoo 19
mit Shopware 6* - siehe [`../README.md`](../README.md) für den Gesamtkontext und
[`../MIGRATION_NOTES.md`](../MIGRATION_NOTES.md) für die Migrationshinweise.

Die Fassung für Odoo 20 liegt in [`../odoo-v20`](../odoo-v20). Gegenstücke mit
identischen Test-IDs liegen in [`../plenty`](../plenty) und
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
./odoo-v19/A005-search_read.sh
```

Skripte, die einzelne Datensätze lesen, ändern oder löschen, erwarten die ID
als Umgebungsvariable, zum Beispiel:

```bash
PARTNER_ID=123 ./odoo-v19/B003-partner-read.sh
```

IDs, `LIMIT` und `OFFSET` müssen ganze Zahlen sein; Suchwerte wie
`DEFAULT_CODE` werden als JSON-String kodiert. Bei ungültigen Werten bricht das
Skript ab, bevor eine Anfrage gesendet wird. Schreib- und Löschtests nur mit
Testdaten ausführen.

## Review

Die Skripte in diesem Ordner wurden durchgesehen von
[**Mathias Goldhan**](https://www.hqgmbh.de/autoren/mathias-goldhan/),
Enterprise-Architekt der [HQ GmbH](https://www.hqgmbh.de/)
(siehe `Reviewed by:` im Kommentarkopf jedes Skripts).
