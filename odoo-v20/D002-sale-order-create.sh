#!/usr/bin/env bash
###############################################################################
# Odoo 20 JSON-2 API Reference
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
# plenty/D002-sale-order-create.sh
#
# Shopware-Pendant:
# shopware/D002-sale-order-create.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################

source "$(dirname "${BASH_SOURCE[0]}")/_json2_common.sh"
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.
set -euo pipefail
: "${ODOO_URL:?}"; : "${ODOO_API_KEY:?}"; : "${CUSTOMER_ID:?Export CUSTOMER_ID=<res.partner id>}"
odoo_require_id CUSTOMER_ID
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/sale.order/create" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"vals_list\":[{\"partner_id\":${CUSTOMER_ID},\"client_order_ref\":\"JSON-2 sales test\"}]}"
