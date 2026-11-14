#!/usr/bin/env bash
# Odoo 20 JSON-2 API Reference | Technisches Referenzwerk: PlentyONE → Odoo 19 mit Shopware 6
# Copyright (c) 2026 HQ GmbH | SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/E016-purchase-order-receipt-status.sh
#
# Shopware-Pendant:
# shopware/E016-purchase-order-receipt-status.sh
#
# Reviewed by:
# Mathias Goldhan
source "$(dirname "${BASH_SOURCE[0]}")/_json2_common.sh"
set -euo pipefail
STATUS="${STATUS:-pending}"
STATUS_JSON="$(odoo_json_string "${STATUS}")"
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/purchase.order/search_read" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"domain\":[[\"receipt_status\",\"=\",${STATUS_JSON}]],\"fields\":[\"id\",\"name\",\"state\",\"receipt_status\"],\"limit\":50}"
