#!/usr/bin/env bash
###############################################################################
# Odoo 19 JSON-2 API Reference
# Technisches Referenzwerk: PlentyONE → Odoo 19 mit Shopware 6
# Copyright (c) 2026 HQ GmbH — https://www.hqgmbh.de
# Repository: https://github.com/hqgmbh/plentyone-to-odoo
# SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/D016-sale-order-salesperson.sh
#
# Shopware-Pendant:
# shopware/D016-sale-order-salesperson.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################
# Voraussetzung: SALESPERSON_ID ist eine res.users-ID.
source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.
set -euo pipefail
: "${SALESPERSON_ID:?Export SALESPERSON_ID=<res.users id>}"
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/sale.order/search_read" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"domain\":[[\"user_id\",\"=\",${SALESPERSON_ID}]],\"fields\":[\"id\",\"name\",\"user_id\",\"state\",\"amount_total\"],\"limit\":50}"
