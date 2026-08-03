#!/usr/bin/env bash
###############################################################################
# Odoo 19 JSON-2 API Reference
#
# PlentyOne -> Odoo 19 Enterprise Migration
#
# Copyright (c) 2026 HQ GmbH
# https://www.hqgmbh.de
#
# Repository:
# https://github.com/hqgmbh/plenty-erp2odoo
#
# SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/D003-sale-order-read.sh
#
# Shopware-Pendant:
# shopware/D003-sale-order-read.sh
#
# Reviewed by:
# Lukas Ehrenberg
###############################################################################

source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.
set -euo pipefail
: "${ODOO_URL:?}"; : "${ODOO_API_KEY:?}"; : "${SALE_ORDER_ID:?Export SALE_ORDER_ID=<sale.order id>}"
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/sale.order/read" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"ids\":[${SALE_ORDER_ID}],\"fields\":[\"id\",\"name\",\"partner_id\",\"state\",\"amount_untaxed\",\"amount_tax\",\"amount_total\",\"order_line\"]}"
