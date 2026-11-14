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
# Mathias Goldhan
###############################################################################

source "$(dirname "${BASH_SOURCE[0]}")/_json2_common.sh"
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${PARTNER_ID:?Export PARTNER_ID=<res.partner id>}"
odoo_require_id PARTNER_ID
curl -X POST \
"${ODOO_URL}/json/2/res.partner/write" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${ODOO_API_KEY}" \
-d '{
  "ids":['"${PARTNER_ID}"'],
  "vals":{
    "email":"json2-test@example.com",
    "is_company":true
  }
}'
