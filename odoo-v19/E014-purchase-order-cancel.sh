#!/usr/bin/env bash
# Odoo 19 JSON-2 API Reference | Technisches Referenzwerk: PlentyONE → Odoo 19 mit Shopware 6
# Copyright (c) 2026 HQ GmbH | SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/E014-purchase-order-cancel.sh
#
# Shopware-Pendant:
# shopware/E014-purchase-order-cancel.sh
#
# Reviewed by:
# Mathias Goldhan
source "$(dirname "${BASH_SOURCE[0]}")/_json2_common.sh"
# Beispiel: PURCHASE_ORDER_ID=123 ./E014-purchase-order-cancel.sh  # Testauftrag
set -euo pipefail
: "${PURCHASE_ORDER_ID:?Export PURCHASE_ORDER_ID=<test purchase.order id>}"
odoo_require_id PURCHASE_ORDER_ID
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/purchase.order/button_cancel" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"ids\":[${PURCHASE_ORDER_ID}]}"
