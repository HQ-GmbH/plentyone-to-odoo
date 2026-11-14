#!/usr/bin/env bash
###############################################################################
# Test-ID: A030
#
# Einfacher Benchmark der search_read()-Methode.
#
# Plenty-Pendant:
# plenty/A030-benchmark-search_read.sh
#
# Shopware-Pendant:
# shopware/A030-benchmark-search_read.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################

source "$(dirname "${BASH_SOURCE[0]}")/_json2_common.sh"
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

time curl \
-X POST \
"${ODOO_URL}/json/2/res.partner/search_read" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${ODOO_API_KEY}" \
-d '{
  "domain":[],
  "fields":[
      "name",
      "email"
  ],
  "limit":100
}'