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
# plenty/D002-sale-order-create.sh
#
# Shopware-Pendant:
# shopware/D002-sale-order-create.sh
###############################################################################

source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.
set -euo pipefail
: "${ODOO_URL:?}"; : "${ODOO_API_KEY:?}"; : "${CUSTOMER_ID:?Export CUSTOMER_ID=<res.partner id>}"
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/sale.order/create" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"values\":{\"partner_id\":${CUSTOMER_ID},\"client_order_ref\":\"JSON-2 sales test\"}}"
