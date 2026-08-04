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

source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -X POST \
"${ODOO_URL}/json/2/res.partner/read" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${ODOO_API_KEY}" \
-d '{
  "ids":[69],
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
