#!/usr/bin/env bash
###############################################################################
# Test-ID: A029
#
# Plenty-Pendant:
# plenty/A029-order-desc.sh
#
# Shopware-Pendant:
# shopware/A029-order-desc.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################

source "$(dirname "${BASH_SOURCE[0]}")/_json2_common.sh"
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl \
-X POST \
"${ODOO_URL}/json/2/res.partner/search_read" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${ODOO_API_KEY}" \
-d '{
  "domain":[],
  "order":"name DESC",
  "fields":[
      "name",
      "email"
  ],
  "limit":10
}'