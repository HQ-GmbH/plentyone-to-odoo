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
OpenAPI-Schemas erstellt, **nicht** gegen eine echte Plenty-Instanz getestet
(anders als die produktiv validierten `odoo/`-Skripte, siehe Haftungshinweis
unten). Jedes Skript mit einer unverifizierten Annahme ist im Kommentarkopf
explizit mit `UNVERIFIZIERT` markiert - vor produktivem Einsatz gegen eine
Test-Instanz pruefen. Details und Migrationshinweise: [`plenty/README.md`](plenty/README.md)
und [`MIGRATION_NOTES.md`](MIGRATION_NOTES.md).

---

# Lizenz

Apache-2.0 License

---

# Haftung

Die Beispiele unter `odoo/` wurden produktiv getestet.

Trotzdem sollten sämtliche Tests zunächst gegen ein Entwicklungs- oder Staging-System durchgeführt werden.

Die Beispiele unter `plenty/` wurden **nicht** gegen eine reale Plenty-Instanz
verifiziert (siehe Abschnitt "Plenty REST API Reference Tests" oben) und sind
entsprechend vorsichtiger zu behandeln.

---

# Referenzwerk

Dieses Repository ergänzt das Tutorial

**PlentyOne → Odoo 19 Enterprise Migration**

Version 2.
