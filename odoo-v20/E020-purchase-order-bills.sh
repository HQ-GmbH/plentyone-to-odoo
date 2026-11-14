#!/usr/bin/env bash
# Odoo 20 JSON-2 API Reference | Technisches Referenzwerk: PlentyONE → Odoo 19 mit Shopware 6
# Copyright (c) 2026 HQ GmbH | SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/E020-purchase-order-bills.sh
#
# Shopware-Pendant:
# shopware/E020-purchase-order-bills.sh
#
# Reviewed by:
# Mathias Goldhan
source "$(dirname "${BASH_SOURCE[0]}")/_json2_common.sh"
# Beispiel: PURCHASE_ORDER_ID=123 ./E020-purchase-order-bills.sh
set -euo pipefail
: "${PURCHASE_ORDER_ID:?Export PURCHASE_ORDER_ID=<purchase.order id>}"
odoo_require_id PURCHASE_ORDER_ID
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/purchase.order/read" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"ids\":[${PURCHASE_ORDER_ID}],\"fields\":[\"id\",\"name\",\"invoice_status\",\"invoice_ids\"]}"
