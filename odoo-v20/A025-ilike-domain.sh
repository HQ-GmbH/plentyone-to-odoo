#!/usr/bin/env bash
###############################################################################
# Test-ID: A025
#
# Plenty-Pendant:
# plenty/A025-ilike-domain.sh
#
# Shopware-Pendant:
# shopware/A025-ilike-domain.sh
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
  "domain":[
      ["name","ilike","Company"]
  ],
  "fields":[
      "name",
      "email"
  ]
}'