# PlentyONE → Odoo 19 Migration & API Integration

Technische Referenz für die Migration von PlentyONE zu Odoo 19 mit Shopware 6
als bestehendem E-Commerce-Frontend.

# Odoo 19 JSON-2 API Reference Tests

## Ziel

Dieses Repository enthält praktisch validierte Referenzimplementierungen der Odoo 19 JSON-2 API.

Alle Beispiele wurden gegen eine reale Odoo-19-Instanz getestet und bilden die Grundlage des Referenzwerks

> **Technisches Referenzwerk: PlentyONE → Odoo 19 mit Shopware 6**

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
es, für jeden Odoo-JSON-2-Testfall eine sinnvolle Plenty-Entsprechung zu
dokumentieren - inklusive der Fälle, in denen es **keine** direkte
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

# Review

Jeder Ordner wurde von einem Spezialisten der [HQ GmbH](https://www.hqgmbh.de/)
durchgesehen; die Zuordnung steht als `Reviewed by:` im Kommentarkopf jedes
Skripts:

| Ordner | Review |
|---|---|
| [`odoo/`](odoo/) | [**Mathias Goldhan**](https://www.hqgmbh.de/autoren/mathias-goldhan/), Enterprise-Architekt |
| [`plenty/`](plenty/) | [**Lukas Ehrenberg**](https://www.hqgmbh.de/autoren/lukas-ehrenberg/), Senior Shopware Developer & Cluster-Spezialist |
| [`shopware/`](shopware/) | [**Christopher Einenkel**](https://www.hqgmbh.de/autoren/christopher-einenkel/), Senior Integration Architect & API Specialist |

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

**Technisches Referenzwerk: PlentyONE → Odoo 19 mit Shopware 6**

Version 2.

Autor: [Mathias Goldhan](https://www.hqgmbh.de/autoren/mathias-goldhan/),
Enterprise-Architekt der [HQ GmbH](https://www.hqgmbh.de/).
