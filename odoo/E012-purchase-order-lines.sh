#!/usr/bin/env bash
# Odoo 19 JSON-2 API Reference | PlentyOne -> Odoo 19 Enterprise Migration
# Copyright (c) 2026 HQ GmbH | SPDX-License-Identifier: Apache-2.0
source ../config.sh
# Beispiel: PURCHASE_ORDER_ID=123 ./E012-purchase-order-lines.sh
set -euo pipefail
: "${PURCHASE_ORDER_ID:?Export PURCHASE_ORDER_ID=<purchase.order id>}"
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/purchase.order.line/search_read" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"domain\":[[\"order_id\",\"=\",${PURCHASE_ORDER_ID}]],\"fields\":[\"id\",\"product_id\",\"name\",\"product_qty\",\"price_unit\",\"price_subtotal\"],\"order\":\"sequence,id\"}"
