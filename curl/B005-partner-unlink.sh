#!/usr/bin/env bash
###############################################################################
# Test-ID: B005
#
# Löscht einen vorhandenen Testpartner.
#
# ACHTUNG:
# Nur Testdaten löschen.
###############################################################################

source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -X POST \
"${ODOO_URL}/json/2/res.partner/unlink" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${ODOO_API_KEY}" \
-d '{
  "ids":[69]
}'
