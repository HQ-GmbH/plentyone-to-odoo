#!/usr/bin/env bash
###############################################################################
# Odoo 19 JSON-2 API Reference
# PlentyOne -> Odoo 19 Enterprise Migration
# Copyright (c) 2026 HQ GmbH — https://www.hqgmbh.de
# Repository: https://github.com/hqgmbh/plenty-erp2odoo
# SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/D018-sale-order-pagination.sh
#
# Shopware-Pendant:
# shopware/D018-sale-order-pagination.sh
#
# Reviewed by:
# Lukas Ehrenberg
###############################################################################
# Optional: LIMIT und OFFSET, Standardwerte 50 und 0.
source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.
set -euo pipefail
LIMIT="${LIMIT:-50}"; OFFSET="${OFFSET:-0}"
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/sale.order/search_read" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"domain\":[],\"fields\":[\"id\",\"name\",\"state\",\"amount_total\"],\"limit\":${LIMIT},\"offset\":${OFFSET},\"order\":\"id asc\"}"
