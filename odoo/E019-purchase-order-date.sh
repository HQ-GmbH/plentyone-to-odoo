#!/usr/bin/env bash
# Odoo 19 JSON-2 API Reference | PlentyOne -> Odoo 19 Enterprise Migration
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
source ../config.sh
set -euo pipefail
DATE_FROM="${DATE_FROM:-2026-01-01}"
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/purchase.order/search_read" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"domain\":[[\"date_order\",\">=\",\"${DATE_FROM}\"]],\"fields\":[\"id\",\"name\",\"date_order\",\"amount_total\"],\"limit\":50}"
