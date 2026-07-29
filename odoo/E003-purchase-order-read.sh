#!/usr/bin/env bash
###############################################################################
# Odoo 19 JSON-2 API Reference
# PlentyOne -> Odoo 19 Enterprise Migration
# Copyright (c) 2026 HQ GmbH — https://www.hqgmbh.de
# Repository: https://github.com/hqgmbh/plenty-erp2odoo
# SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/E003-purchase-order-read.sh
#
# Shopware-Pendant:
# shopware/E003-purchase-order-read.sh
###############################################################################
source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Beispiel: PURCHASE_ORDER_ID=123 ./E003-purchase-order-read.sh
set -euo pipefail
: "${PURCHASE_ORDER_ID:?Export PURCHASE_ORDER_ID=<purchase.order id>}"
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/purchase.order/read" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"ids\":[${PURCHASE_ORDER_ID}],\"fields\":[\"id\",\"name\",\"partner_id\",\"state\",\"amount_untaxed\",\"amount_tax\",\"amount_total\",\"order_line\"]}"
