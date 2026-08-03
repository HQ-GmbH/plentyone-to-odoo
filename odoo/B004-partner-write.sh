#!/usr/bin/env bash
###############################################################################
# Test-ID: B004
#
# Aktualisiert einen bestehenden Partner.
#
# Plenty-Pendant:
# plenty/B004-partner-write.sh
#
# Shopware-Pendant:
# shopware/B004-partner-write.sh
#
# Reviewed by:
# Lukas Ehrenberg
###############################################################################

source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -X POST \
"${ODOO_URL}/json/2/res.partner/write" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${ODOO_API_KEY}" \
-d '{
  "ids":[69],
  "vals":{
    "email":"json2-test@example.com",
    "is_company":true
  }
}'
