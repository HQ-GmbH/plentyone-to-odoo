#!/usr/bin/env bash
###############################################################################
# Test-ID: B009
#
# Sucht ausschließlich Privatpersonen.
#
# Plenty-Pendant:
# plenty/B009-partner-individuals.sh
#
# Shopware-Pendant:
# shopware/B009-partner-individuals.sh
###############################################################################

source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -X POST \
"${ODOO_URL}/json/2/res.partner/search_read" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${ODOO_API_KEY}" \
-d '{
  "domain":[
      ["is_company","=",false]
  ],
  "fields":[
      "id",
      "name",
      "email",
      "is_company"
  ],
  "limit":20
}'
