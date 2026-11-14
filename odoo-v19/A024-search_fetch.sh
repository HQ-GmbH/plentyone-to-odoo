#!/usr/bin/env bash
###############################################################################
# Test-ID: A024
#
# Plenty-Pendant:
# plenty/A024-search_fetch.sh
#
# Shopware-Pendant:
# shopware/A024-search_fetch.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################

source "$(dirname "${BASH_SOURCE[0]}")/_json2_common.sh"
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl \
-X POST \
"${ODOO_URL}/json/2/res.partner/search_fetch" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${ODOO_API_KEY}" \
-d '{
  "domain":[],
  "field_names":[
      "name",
      "email"
  ],
  "limit":10
}'