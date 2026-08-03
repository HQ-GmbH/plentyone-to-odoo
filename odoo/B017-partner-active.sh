#!/usr/bin/env bash
###############################################################################
# Test-ID: B017
#
# Liefert alle aktiven Partner.
#
# Plenty-Pendant:
# plenty/B017-partner-active.sh
#
# Shopware-Pendant:
# shopware/B017-partner-active.sh
#
# Reviewed by:
# Lukas Ehrenberg
###############################################################################

source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -X POST \
"${ODOO_URL}/json/2/res.partner/search_read" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${ODOO_API_KEY}" \
-d '{
  "domain":[["active","=",true]],
  "fields":[
      "id",
      "name",
      "email",
      "active"
  ],
  "limit":20
}'
