#!/usr/bin/env bash
###############################################################################
# Test-ID: B013
#
# Liefert Kontakte mit Parent-Unternehmen.
#
# Plenty-Pendant:
# plenty/B013-partner-contacts.sh
#
# Shopware-Pendant:
# shopware/B013-partner-contacts.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################

source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -X POST \
"${ODOO_URL}/json/2/res.partner/search_read" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${ODOO_API_KEY}" \
-d '{
  "domain":[["parent_id","!=",false]],
  "fields":[
      "id",
      "name",
      "parent_id",
      "email"
  ],
  "limit":20
}'