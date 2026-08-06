#!/usr/bin/env bash
###############################################################################
# Odoo 19 JSON-2 API Reference
# Technisches Referenzwerk: PlentyONE → Odoo 19 mit Shopware 6
# Copyright (c) 2026 HQ GmbH — https://www.hqgmbh.de
# Repository: https://github.com/hqgmbh/plentyone-to-odoo
# SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/D015-sale-order-invoice-status.sh
#
# Shopware-Pendant:
# shopware/D015-sale-order-invoice-status.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################
# Optional: INVOICE_STATUS, Standardwert „to invoice“.
source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.
set -euo pipefail
INVOICE_STATUS="${INVOICE_STATUS:-to invoice}"
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/sale.order/search_read" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"domain\":[[\"invoice_status\",\"=\",\"${INVOICE_STATUS}\"]],\"fields\":[\"id\",\"name\",\"state\",\"invoice_status\",\"amount_total\"],\"limit\":50}"
