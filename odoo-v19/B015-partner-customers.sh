#!/usr/bin/env bash
###############################################################################
# Test-ID: B015
#
# Liefert alle Kunden.
#
# Plenty-Pendant:
# plenty/B015-partner-customers.sh
#
# Shopware-Pendant:
# shopware/B015-partner-customers.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################

source "$(dirname "${BASH_SOURCE[0]}")/_json2_common.sh"
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -X POST \
"${ODOO_URL}/json/2/res.partner/search_read" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${ODOO_API_KEY}" \
-d '{
  "domain":[["customer_rank",">",0]],
  "fields":[
      "name",
      "customer_rank",
      "email"
  ],
  "limit":20
}'
