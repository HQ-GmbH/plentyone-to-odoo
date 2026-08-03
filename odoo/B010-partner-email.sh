#!/usr/bin/env bash
###############################################################################
# Test-ID: B010
#
# Sucht Partner anhand einer E-Mail-Adresse.
#
# Plenty-Pendant:
# plenty/B010-partner-email.sh
#
# Shopware-Pendant:
# shopware/B010-partner-email.sh
#
# Reviewed by:
# Lukas Ehrenberg
###############################################################################

source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -X POST \
"${ODOO_URL}/json/2/res.partner/search_read" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${ODOO_API_KEY}" \
-d '{
  "domain":[
      ["email","ilike","example.com"]
  ],
  "fields":[
      "id",
      "name",
      "email"
  ],
  "limit":20
}'
