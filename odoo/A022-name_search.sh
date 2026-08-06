#!/usr/bin/env bash
###############################################################################
# Odoo 19 JSON-2 API Reference
#
# Companion Repository to the reference book
# "Technisches Referenzwerk: PlentyONE → Odoo 19 mit Shopware 6"
#
# Copyright (c) 2026 HQ GmbH
# https://www.hqgmbh.de
#
# Repository
# https://github.com/hqgmbh/plentyone-to-odoo
#
# SPDX-License-Identifier: Apache-2.0
#
# Test-ID:
# A022
#
# Beschreibung:
# Führt eine name_search() auf res.partner aus.
#
# Erwartetes Ergebnis:
# Liste passender Partner.
#
# Plenty-Pendant:
# plenty/A022-name_search.sh
#
# Shopware-Pendant:
# shopware/A022-name_search.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################

source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl \
-X POST \
"${ODOO_URL}/json/2/res.partner/name_search" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${ODOO_API_KEY}" \
-d '{
  "name":"Company",
  "limit":10
}'