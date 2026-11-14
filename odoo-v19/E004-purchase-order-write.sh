#!/usr/bin/env bash
###############################################################################
# Odoo 19 JSON-2 API Reference
# Technisches Referenzwerk: PlentyONE → Odoo 19 mit Shopware 6
# Copyright (c) 2026 HQ GmbH — https://www.hqgmbh.de
# Repository: https://github.com/hqgmbh/plentyone-to-odoo
# SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/E004-purchase-order-write.sh
#
# Shopware-Pendant:
# shopware/E004-purchase-order-write.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################
source "$(dirname "${BASH_SOURCE[0]}")/_json2_common.sh"
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Beispiel: PURCHASE_ORDER_ID=123 ./E004-purchase-order-write.sh
set -euo pipefail
: "${PURCHASE_ORDER_ID:?Export PURCHASE_ORDER_ID=<draft purchase.order id>}"
odoo_require_id PURCHASE_ORDER_ID
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/purchase.order/write" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"ids\":[${PURCHASE_ORDER_ID}],\"vals\":{\"partner_ref\":\"JSON-2 purchase test updated\"}}"
