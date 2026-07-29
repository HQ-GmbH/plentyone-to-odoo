#!/usr/bin/env bash
###############################################################################
# Test-ID: B007
#
# Liest Felddefinitionen des Partner-Modells.
###############################################################################

source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -X POST \
"${ODOO_URL}/json/2/res.partner/fields_get" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${ODOO_API_KEY}" \
-d '{
  "attributes":[
    "string",
    "type",
    "required"
  ]
}'