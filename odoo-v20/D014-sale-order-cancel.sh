#!/usr/bin/env bash
###############################################################################
# Odoo 20 JSON-2 API Reference
# Technisches Referenzwerk: PlentyONE → Odoo 19 mit Shopware 6
# Copyright (c) 2026 HQ GmbH — https://www.hqgmbh.de
# Repository: https://github.com/hqgmbh/plentyone-to-odoo
# SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/D014-sale-order-cancel.sh
#
# Shopware-Pendant:
# shopware/D014-sale-order-cancel.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################
# Voraussetzung: SALE_ORDER_ID ist ein Testauftrag.
# Beispiel: SALE_ORDER_ID=123 ./D014-sale-order-cancel.sh
source "$(dirname "${BASH_SOURCE[0]}")/_json2_common.sh"
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.
set -euo pipefail
: "${SALE_ORDER_ID:?Export SALE_ORDER_ID=<test sale.order id>}"
odoo_require_id SALE_ORDER_ID
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/sale.order/action_cancel" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"ids\":[${SALE_ORDER_ID}]}"
