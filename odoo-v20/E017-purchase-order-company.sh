#!/usr/bin/env bash
# Odoo 20 JSON-2 API Reference | Technisches Referenzwerk: PlentyONE → Odoo 19 mit Shopware 6
# Copyright (c) 2026 HQ GmbH | SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/E017-purchase-order-company.sh
#
# Shopware-Pendant:
# shopware/E017-purchase-order-company.sh
#
# Reviewed by:
# Mathias Goldhan
source "$(dirname "${BASH_SOURCE[0]}")/_json2_common.sh"
# Beispiel: COMPANY_ID=1 ./E017-purchase-order-company.sh
set -euo pipefail
: "${COMPANY_ID:?Export COMPANY_ID=<res.company id>}"
odoo_require_id COMPANY_ID
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/purchase.order/search_read" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"domain\":[[\"company_id\",\"=\",${COMPANY_ID}]],\"fields\":[\"id\",\"name\",\"company_id\",\"state\",\"amount_total\"],\"limit\":50}"
