#!/usr/bin/env bash
###############################################################################
# Test-ID: B014
#
# Zeigt Land und Sprache.
#
# Plenty-Pendant:
# plenty/B014-partner-country-language.sh
#
# Shopware-Pendant:
# shopware/B014-partner-country-language.sh
###############################################################################

source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -X POST \
"${ODOO_URL}/json/2/res.partner/search_read" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${ODOO_API_KEY}" \
-d '{
  "domain":[],
  "fields":[
      "name",
      "country_id",
      "lang"
  ],
  "limit":20
}'
