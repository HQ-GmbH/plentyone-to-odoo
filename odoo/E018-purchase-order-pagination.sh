#!/usr/bin/env bash
# Odoo 19 JSON-2 API Reference | PlentyOne -> Odoo 19 Enterprise Migration
# Copyright (c) 2026 HQ GmbH | SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/E018-purchase-order-pagination.sh
#
# Shopware-Pendant:
# shopware/E018-purchase-order-pagination.sh
#
# Reviewed by:
# Lukas Ehrenberg
source ../config.sh
set -euo pipefail
LIMIT="${LIMIT:-50}"; OFFSET="${OFFSET:-0}"
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/purchase.order/search_read" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"domain\":[],\"fields\":[\"id\",\"name\",\"state\",\"amount_total\"],\"limit\":${LIMIT},\"offset\":${OFFSET},\"order\":\"id asc\"}"
