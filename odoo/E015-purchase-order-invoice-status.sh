#!/usr/bin/env bash
# Odoo 19 JSON-2 API Reference | PlentyOne -> Odoo 19 Enterprise Migration
# Copyright (c) 2026 HQ GmbH | SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/E015-purchase-order-invoice-status.sh
#
# Shopware-Pendant:
# shopware/E015-purchase-order-invoice-status.sh
#
# Reviewed by:
# Mathias Goldhan
source ../config.sh
set -euo pipefail
STATUS="${STATUS:-to invoice}"
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/purchase.order/search_read" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"domain\":[[\"invoice_status\",\"=\",\"${STATUS}\"]],\"fields\":[\"id\",\"name\",\"state\",\"invoice_status\",\"amount_total\"],\"limit\":50}"
