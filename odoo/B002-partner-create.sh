#!/usr/bin/env bash
###############################################################################
# Test-ID: B002
#
# Erstellt einen neuen Partner.
#
# Plenty-Pendant:
# plenty/B002-partner-create.sh
#
# Shopware-Pendant:
# shopware/B002-partner-create.sh
###############################################################################

source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -X POST \
"${ODOO_URL}/json/2/res.partner/create" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${ODOO_API_KEY}" \
-d '{
  "vals_list":[
    {
      "name":"JSON2 Testpartner",
      "email":"json2-test@example.com",
      "is_company":true
    }
  ]
}'
