#!/usr/bin/env bash
###############################################################################
# Odoo 20 JSON-2 API Reference
# Technisches Referenzwerk: PlentyONE → Odoo 19 mit Shopware 6
# Copyright (c) 2026 HQ GmbH — https://www.hqgmbh.de
# Repository: https://github.com/hqgmbh/plentyone-to-odoo
# SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/D018-sale-order-pagination.sh
#
# Shopware-Pendant:
# shopware/D018-sale-order-pagination.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################
# Optional: LIMIT und OFFSET, Standardwerte 50 und 0.
source "$(dirname "${BASH_SOURCE[0]}")/_json2_common.sh"
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.
set -euo pipefail
LIMIT="${LIMIT:-50}"; OFFSET="${OFFSET:-0}"
odoo_require_uint LIMIT; odoo_require_uint OFFSET
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/sale.order/search_read" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"domain\":[],\"fields\":[\"id\",\"name\",\"state\",\"amount_total\"],\"limit\":${LIMIT},\"offset\":${OFFSET},\"order\":\"id asc\"}"
