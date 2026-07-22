#!/usr/bin/env bash
###############################################################################
# Test-ID: A023
###############################################################################

source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl \
-X POST \
"${ODOO_URL}/json/2/res.partner/read_group" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${ODOO_API_KEY}" \
-d '{
  "domain":[],
  "fields":["customer_rank"],
  "groupby":["is_company"]
}'