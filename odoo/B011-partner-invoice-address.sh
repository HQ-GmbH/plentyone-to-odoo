#!/usr/bin/env bash
###############################################################################
# Odoo 19 JSON-2 API Reference
#
# Companion Repository
# https://github.com/hqgmbh/plenty-erp2odoo
#
# Copyright (c) 2026 HQ GmbH
#
# SPDX-License-Identifier: Apache-2.0
#
# Test-ID:
# B011
#
# Beschreibung:
# Sucht alle Rechnungsadressen.
#
# Plenty-Pendant:
# plenty/B011-partner-invoice-address.sh
#
# Shopware-Pendant:
# shopware/B011-partner-invoice-address.sh
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
  "domain":[["type","=","invoice"]],
  "fields":["id","name","parent_id","email"],
  "limit":20
}'