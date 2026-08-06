#!/usr/bin/env bash
###############################################################################
# Odoo 19 JSON-2 API Reference
# Technisches Referenzwerk: PlentyONE → Odoo 19 mit Shopware 6
# Copyright (c) 2026 HQ GmbH — https://www.hqgmbh.de
# Repository: https://github.com/hqgmbh/plentyone-to-odoo
# SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/D013-sale-order-confirm.sh
#
# Shopware-Pendant:
# shopware/D013-sale-order-confirm.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################
# Voraussetzung: SALE_ORDER_ID ist ein bestätigungsfähiger Testentwurf.
# Beispiel: SALE_ORDER_ID=123 ./D013-sale-order-confirm.sh
source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.
set -euo pipefail
: "${SALE_ORDER_ID:?Export SALE_ORDER_ID=<draft test sale.order id>}"
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/sale.order/action_confirm" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"ids\":[${SALE_ORDER_ID}]}"
