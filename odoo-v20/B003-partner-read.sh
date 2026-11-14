#!/usr/bin/env bash
###############################################################################
# Test-ID: B003
#
# Liest einen vorhandenen Partner.
#
# Plenty-Pendant:
# plenty/B003-partner-read.sh
#
# Shopware-Pendant:
# shopware/B003-partner-read.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################

source "$(dirname "${BASH_SOURCE[0]}")/_json2_common.sh"
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${PARTNER_ID:?Export PARTNER_ID=<res.partner id>}"
odoo_require_id PARTNER_ID
curl -X POST \
"${ODOO_URL}/json/2/res.partner/read" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${ODOO_API_KEY}" \
-d '{
  "ids":['"${PARTNER_ID}"'],
  "fields":[
    "id",
    "name",
    "email",
    "is_company",
    "active",
    "create_date",
    "write_date"
  ]
}'
