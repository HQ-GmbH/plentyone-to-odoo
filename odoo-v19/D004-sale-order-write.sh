#!/usr/bin/env bash
###############################################################################
# Odoo 19 JSON-2 API Reference
#
# Technisches Referenzwerk: PlentyONE → Odoo 19 mit Shopware 6
#
# Copyright (c) 2026 HQ GmbH
# https://www.hqgmbh.de
#
# Repository:
# https://github.com/hqgmbh/plentyone-to-odoo
#
# SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/D004-sale-order-write.sh
#
# Shopware-Pendant:
# shopware/D004-sale-order-write.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################

source "$(dirname "${BASH_SOURCE[0]}")/_json2_common.sh"
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.
set -euo pipefail
: "${ODOO_URL:?}"; : "${ODOO_API_KEY:?}"; : "${SALE_ORDER_ID:?Export SALE_ORDER_ID=<draft sale.order id>}"
odoo_require_id SALE_ORDER_ID
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/sale.order/write" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"ids\":[${SALE_ORDER_ID}],\"vals\":{\"client_order_ref\":\"JSON-2 sales test updated\"}}"
