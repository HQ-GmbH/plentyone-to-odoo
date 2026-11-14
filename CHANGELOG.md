# Changelog

## Version 2.0.0 — 2026-11-14

Major version because script paths change: `./odoo/…` becomes
`./odoo-v19/…` or `./odoo-v20/…`.

### Changed

- `odoo/` renamed to `odoo-v19/`.
- `plenty/` and `shopware/` headers now point their Odoo counterpart to
  `odoo-v20/`.

### Added

- `odoo-v20/` — 210 scripts for the Odoo 20 JSON-2 API, derived from
  `odoo-v19/`. Request format and headers checked against a local mock server;
  not yet tested against a live Odoo 20 instance.
- `_json2_common.sh` in both Odoo folders: loads `config.sh` relative to the
  folder, sets `User-Agent` and an optional `X-Odoo-Database` header
  (`ODOO_DATABASE`), rejects non-integer record ids, `LIMIT` and `OFFSET`,
  and encodes search values from the environment as JSON strings.
- `config/config.example.sh`: optional `ODOO_DATABASE` and the variables for
  the H/I/J infrastructure series.

### Fixed (odoo-v19 and odoo-v20)

- `create`/`write` bodies use `vals_list`/`vals` instead of `values`
  (C002, C004, C017, D002, D004, E002, E004); `detailed_type` replaced by
  `type` (C002, C010). Both apply from Odoo 18 on.
- A012–A014 and B003–B005 no longer read, write or delete the hard-coded
  partner 69; they require `PARTNER_ID`.
- A006 no longer prints a placeholder line before the JSON response.
- C001 uses `=ilike` for the prefix search; `ilike` matched every code that
  contains a "C".
- J series: removed 20 identical placeholder scripts that all queried
  `/api/v1/status/buildinfo`; the actual Prometheus queries now end in `.sh`.
- All scripts are executable and can be started from any working directory.

### Open points

- A023 `read_group`: check on Odoo 20 whether it is still public or must be
  replaced by `formatted_read_group`.
- C016 `uom_po_id`: check whether the field still exists.
- A024 `search_fetch`: JSON-2 returns record ids only, no field values.
- I014, I015, I016, I019, I020: verify the Checkmk endpoints against the
  REST API documentation of the site.
- H008–H010 and H007/H020 send identical requests.
- H series passes the RabbitMQ password via `curl -u`, which shows it in the
  process list.

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
