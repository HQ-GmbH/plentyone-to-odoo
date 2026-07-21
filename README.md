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

# Projektstruktur

```text
curl/
docs/
examples/
results/
```

---

# Voraussetzungen

* Odoo 19
* JSON-2 API aktiviert
* API-Key
* curl ≥ 8.x

---

# Beispiel

```bash
./curl/001-search_read.sh
```

---

# Lizenz

MIT License

---

# Haftung

Die Beispiele wurden produktiv getestet.

Trotzdem sollten sämtliche Tests zunächst gegen ein Entwicklungs- oder Staging-System durchgeführt werden.

---

# Referenzwerk

Dieses Repository ergänzt das Buch

**PlentyOne → Odoo 19 Enterprise Migration**

Version 2.
