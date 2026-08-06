#!/usr/bin/env bash
###############################################################################
# Odoo 19 JSON-2 API Reference
# PlentyOne -> Odoo 19 Enterprise Migration
# Copyright (c) 2026 HQ GmbH — https://www.hqgmbh.de
# Repository: https://github.com/hqgmbh/plentyone-to-odoo
# SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/D012-sale-order-lines.sh
#
# Shopware-Pendant:
# shopware/D012-sale-order-lines.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################
# Voraussetzung: SALE_ORDER_ID ist eine gültige sale.order-ID.
# Beispiel: SALE_ORDER_ID=123 ./D012-sale-order-lines.sh
source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.
set -euo pipefail
: "${SALE_ORDER_ID:?Export SALE_ORDER_ID=<sale.order id>}"
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/sale.order.line/search_read" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"domain\":[[\"order_id\",\"=\",${SALE_ORDER_ID}]],\"fields\":[\"id\",\"product_id\",\"name\",\"product_uom_qty\",\"price_unit\",\"price_subtotal\"],\"order\":\"sequence,id\"}"
