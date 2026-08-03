#!/usr/bin/env bash
# Odoo 19 JSON-2 API Reference | PlentyOne -> Odoo 19 Enterprise Migration
# Copyright (c) 2026 HQ GmbH | SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/E020-purchase-order-bills.sh
#
# Shopware-Pendant:
# shopware/E020-purchase-order-bills.sh
#
# Reviewed by:
# Lukas Ehrenberg
source ../config.sh
# Beispiel: PURCHASE_ORDER_ID=123 ./E020-purchase-order-bills.sh
set -euo pipefail
: "${PURCHASE_ORDER_ID:?Export PURCHASE_ORDER_ID=<purchase.order id>}"
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/purchase.order/read" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"ids\":[${PURCHASE_ORDER_ID}],\"fields\":[\"id\",\"name\",\"invoice_status\",\"invoice_ids\"]}"
