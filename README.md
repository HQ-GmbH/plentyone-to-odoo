# plenty-erp2odoo
Migration von Plenty ERP zu Odoo

# Odoo 19 JSON-2 API Reference Tests

## Ziel

Dieses Repository enthält praktisch validierte Referenzimplementierungen der Odoo 19 JSON-2 API.

Alle Beispiele wurden gegen eine reale Odoo-19-Instanz getestet und bilden die Grundlage des Referenzwerks

> **PlentyOne → Odoo 19 Enterprise Migration**

Die Beispiele dienen als reproduzierbare Referenz für

* ERP-Entwickler
* Integratoren
* Softwarearchitekten
* Enterprise-Projekte

---

# Enthaltene Tests

| Test           | Status |
| -------------- | :----: |
| Authentication |    ✅   |
| fields_get()   |    ✅   |
| search()       |    ✅   |
| search_read()  |    ✅   |
| read()         |    ✅   |
| create()       |    ✅   |
| write()        |    ✅   |
| unlink()       |    ✅   |
| load()         |    ✅   |

---

# Voraussetzungen

* Odoo 19
* JSON-2 API aktiviert
* API-Key
* curl ≥ 8.x

---

# Beispiel

```bash
./odoo/A005-search_read.sh
```

---

# Plenty REST API Reference Tests

Im Ordner [`plenty/`](plenty/) liegt das Gegenstück zu `odoo/`: dieselben
Test-IDs (A001-G020), aber gegen die PlentyMarkets/PlentyONE REST API. Ziel ist
es, fuer jeden Odoo-JSON-2-Testfall eine sinnvolle Plenty-Entsprechung zu
dokumentieren - inklusive der Faelle, in denen es **keine** direkte
Entsprechung gibt (z.B. Odoos Buchhaltungsmodell `account.move`).

**Wichtiger Unterschied zu den `odoo/`-Skripten:** Die `plenty/`-Skripte wurden
auf Basis der offiziellen Plenty-Dokumentation und des öffentlichen
OpenAPI-Schemas erstellt und geprüft. Details und Migrationshinweise:
[`plenty/README.md`](plenty/README.md) und [`MIGRATION_NOTES.md`](MIGRATION_NOTES.md).

---

# Shopware 6.7 Admin API Reference Tests

Im Ordner [`shopware/`](shopware/) liegt ein drittes Gegenstück - wieder
dieselben Test-IDs (A001-G020), aber gegen die Shopware 6.7 Admin API. Wie bei
`plenty/` inklusive expliziter `GAP:`-Hinweise, wo Shopware kein Äquivalent
bietet (z.B. Serie E/Einkauf komplett, Serie F/Lager und G/Buchhaltung
überwiegend - siehe [`shopware/README.md`](shopware/README.md)).

**Wie bei `plenty/`:** Die `shopware/`-Skripte wurden auf Basis der offiziellen
Shopware-Dokumentation und des OpenAPI-Schemas erstellt und gegen eine echte
Shopware-Instanz getestet. Details: [`shopware/README.md`](shopware/README.md).

---

# Lizenz

Apache-2.0 License

---

# Haftung

Die Beispiele unter `odoo/` wurden produktiv getestet, die unter `shopware/`
gegen eine echte Shopware-Instanz. Die unter `plenty/` wurden geprüft und
zusätzlich systematisch gegen das offizielle OpenAPI-Schema abgeglichen (siehe
[`plenty/README.md`](plenty/README.md)).

Trotzdem sollten sämtliche Tests zunächst gegen ein Entwicklungs- oder Staging-System durchgeführt werden.

---

# Referenzwerk

Dieses Repository ergänzt das Tutorial

**PlentyOne → Odoo 19 Enterprise Migration**

Version 2.
