#!/usr/bin/env bash
###############################################################################
# Odoo 19 JSON-2 API Reference
#
# Companion Repository zum Referenzwerk
# "PlentyOne → Odoo 19 Enterprise Migration"
#
# Copyright (c) 2026 HQ GmbH
# https://www.hqgmbh.de
#
# Repository:
# https://github.com/hqgmbh/plentyone-to-odoo
#
# Autor:
# Mathias Goldhan
#
# SPDX-License-Identifier: Apache-2.0
#
# Test-ID:
# B001
#
# Beschreibung:
# Sucht Geschäftspartner anhand eines Namensfragments.
#
# Erwartetes Ergebnis:
# Liste passender Partner.
#
# Plenty-Pendant:
# plenty/B001-partner-search.sh
#
# Shopware-Pendant:
# shopware/B001-partner-search.sh
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
  "domain":[["name","ilike","Company"]],
  "fields":[
    "id",
    "name",
    "email",
    "customer_rank"
  ],
  "limit":10
}'
