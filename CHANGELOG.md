# Changelog

## Version 1.0.0 — 2026-08-06

Initial release. 512 reference scripts covering three APIs with identical test
IDs, so every call can be compared side by side across systems.

### Contents

- `odoo/` — 210 scripts against the Odoo 19 JSON-2 API. Series A–G cover the
  business API, H–J the infrastructure behind a self-hosted installation
  (RabbitMQ, Checkmk, Prometheus).
- `plenty/` — 151 scripts against the PlentyONE REST API, series A–G.
- `shopware/` — 151 scripts against the Shopware 6.7 Admin API, series A–G.
- `MIGRATION_NOTES.md` — every structural difference found between the three
  systems, sorted by topic, as the basis for a migration tool.

### Verification

- `odoo/` tested against a live Odoo 19 instance.
- `plenty/` reconciled against the official plentymarkets OpenAPI v3 schema
  (1199 paths): path, method, query parameters and request bodies.
- `shopware/` reconciled against the official Shopware Admin API schema
  (678 paths, 419 component schemas), plus DAL grammar, filter types and field
  names including association paths; tested against a live instance.

Where a schema and a live instance disagreed, the scripts follow the instance
and the comment header records both — for example `/rest/reorders` and
`/rest/warehouses` on PlentyONE, or the document-create body on Shopware.

### Review

| Folder | Reviewer |
|---|---|
| `odoo/` | Mathias Goldhan, Enterprise-Architekt |
| `plenty/` | Lukas Ehrenberg, Senior Shopware Developer & Cluster-Spezialist |
| `shopware/` | Christopher Einenkel, Senior Integration Architect & API Specialist |
