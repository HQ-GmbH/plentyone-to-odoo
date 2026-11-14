#!/usr/bin/env bash
###############################################################################
# Test-ID: B005
#
# Löscht einen vorhandenen Testpartner.
#
# ACHTUNG:
# Nur Testdaten löschen.
#
# Plenty-Pendant:
# plenty/B005-partner-unlink.sh
#
# Shopware-Pendant:
# shopware/B005-partner-unlink.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################

source "$(dirname "${BASH_SOURCE[0]}")/_json2_common.sh"
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

# Nur Test-Partner löschen.
: "${PARTNER_ID:?Export PARTNER_ID=<res.partner id>}"
odoo_require_id PARTNER_ID
curl -X POST \
"${ODOO_URL}/json/2/res.partner/unlink" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${ODOO_API_KEY}" \
-d '{
  "ids":['"${PARTNER_ID}"']
}'
