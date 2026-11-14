#!/usr/bin/env bash
# Odoo 19 JSON-2 API Reference | Technisches Referenzwerk: PlentyONE → Odoo 19 mit Shopware 6
# Copyright (c) 2026 HQ GmbH | SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/E019-purchase-order-date.sh
#
# Shopware-Pendant:
# shopware/E019-purchase-order-date.sh
#
# Reviewed by:
# Mathias Goldhan
source "$(dirname "${BASH_SOURCE[0]}")/_json2_common.sh"
set -euo pipefail
DATE_FROM="${DATE_FROM:-2026-01-01}"
DATE_FROM_JSON="$(odoo_json_string "${DATE_FROM}")"
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/purchase.order/search_read" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"domain\":[[\"date_order\",\">=\",${DATE_FROM_JSON}]],\"fields\":[\"id\",\"name\",\"date_order\",\"amount_total\"],\"limit\":50}"
