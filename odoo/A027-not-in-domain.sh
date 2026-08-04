#!/usr/bin/env bash
###############################################################################
# Test-ID: A027
#
# Plenty-Pendant:
# plenty/A027-not-in-domain.sh
#
# Shopware-Pendant:
# shopware/A027-not-in-domain.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################

source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl \
-X POST \
"${ODOO_URL}/json/2/res.partner/search_read" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${ODOO_API_KEY}" \
-d '{
  "domain":[
      ["id","not in",[1,9]]
  ],
  "limit":10,
  "fields":[
      "name"
  ]
}'