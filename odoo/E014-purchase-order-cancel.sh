#!/usr/bin/env bash
# Odoo 19 JSON-2 API Reference | PlentyOne -> Odoo 19 Enterprise Migration
# Copyright (c) 2026 HQ GmbH | SPDX-License-Identifier: Apache-2.0
source ../config.sh
# Beispiel: PURCHASE_ORDER_ID=123 ./E014-purchase-order-cancel.sh  # Testauftrag
set -euo pipefail
: "${PURCHASE_ORDER_ID:?Export PURCHASE_ORDER_ID=<test purchase.order id>}"
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/purchase.order/button_cancel" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"ids\":[${PURCHASE_ORDER_ID}]}"
