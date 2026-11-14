#!/usr/bin/env bash
###############################################################################
# Odoo 20 JSON-2 API Reference
#
# Companion Repository zum
# "Technischen Referenzwerk: PlentyONE → Odoo 19 mit Shopware 6"
#
# Copyright (c) 2026 HQ GmbH
# https://www.hqgmbh.de
#
# Repository:
# https://github.com/hqgmbh/plentyone-to-odoo
#
# SPDX-License-Identifier: Apache-2.0
#
# Test-ID:
# B006
#
# Beschreibung:
# Führt eine name_search() auf Geschäftspartnern durch.
#
# Plenty-Pendant:
# plenty/B006-partner-name-search.sh
#
# Shopware-Pendant:
# shopware/B006-partner-name-search.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################

source "$(dirname "${BASH_SOURCE[0]}")/_json2_common.sh"
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -X POST \
"${ODOO_URL}/json/2/res.partner/name_search" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${ODOO_API_KEY}" \
-d '{
  "name":"Company",
  "limit":10
}'