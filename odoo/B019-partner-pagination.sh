#!/usr/bin/env bash
###############################################################################
# Odoo 19 JSON-2 API Reference
#
# Companion Repository zum Referenzwerk
# "PlentyOne → Odoo 19 Enterprise Migration"
#
# Copyright (c) 2026 HQ GmbH
# https://www.hqgmbh.de
#
# Repository:
# https://github.com/hqgmbh/plenty-erp2odoo
#
# SPDX-License-Identifier: Apache-2.0
#
# Test-ID:
# B019
#
# Beschreibung:
# Demonstriert Pagination über offset und limit.
#
# Erwartetes Ergebnis:
# Liefert Partner 21–40.
#
# Plenty-Pendant:
# plenty/B019-partner-pagination.sh
#
# Shopware-Pendant:
# shopware/B019-partner-pagination.sh
###############################################################################

source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -X POST \
"${ODOO_URL}/json/2/res.partner/search_read" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${ODOO_API_KEY}" \
-d '{
  "domain": [],
  "offset": 20,
  "limit": 20,
  "order": "id ASC",
  "fields": [
    "id",
    "name",
    "email"
  ]
}'
