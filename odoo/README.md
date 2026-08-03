# Odoo 19 JSON-2 API Reference Tests

Referenzimplementierungen der Odoo 19 JSON-2 API, getestet gegen eine reale
Odoo-19-Instanz. Grundlage des Referenzwerks *PlentyOne → Odoo 19 Enterprise
Migration* - siehe [`../README.md`](../README.md) für den Gesamtkontext und
[`../MIGRATION_NOTES.md`](../MIGRATION_NOTES.md) für die Migrationshinweise.

Gegenstücke mit identischen Test-IDs liegen in [`../plenty`](../plenty) und
[`../shopware`](../shopware).

## Voraussetzungen

`../config.sh` muss setzen:

```bash
export ODOO_URL="https://dein-odoo-host"
export ODOO_API_KEY="dein-api-key"
```

Die Serien **H**, **I** und **J** testen die Infrastruktur hinter einer
selbstgehosteten Installation (RabbitMQ, Checkmk, Prometheus) und benötigen
zusätzlich `RABBITMQ_*`, `CHECKMK_*` bzw. `PROMETHEUS_URL`.

## Ausführung

Aus diesem Verzeichnis heraus ausführen, da die Skripte `../config.sh` relativ
zum aktuellen Arbeitsverzeichnis laden:

```bash
cd odoo
./A005-search_read.sh
```

## Review

Die Skripte in diesem Ordner wurden durchgesehen von **Lukas Ehrenberg**
(siehe `Reviewed by:` im Kommentarkopf jedes Skripts).
