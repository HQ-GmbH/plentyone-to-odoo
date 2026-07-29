#!/usr/bin/env bash
###############################################################################
# Odoo 19 JSON-2 API Reference
# PlentyOne -> Odoo 19 Enterprise Migration
# Copyright (c) 2026 HQ GmbH — https://www.hqgmbh.de
# Repository: https://github.com/hqgmbh/plenty-erp2odoo
# SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/D017-sale-order-company.sh
#
# Shopware-Pendant:
# shopware/D017-sale-order-company.sh
###############################################################################
# Voraussetzung: COMPANY_ID ist eine res.company-ID.
source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.
set -euo pipefail
: "${COMPANY_ID:?Export COMPANY_ID=<res.company id>}"
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/sale.order/search_read" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"domain\":[[\"company_id\",\"=\",${COMPANY_ID}]],\"fields\":[\"id\",\"name\",\"company_id\",\"state\",\"amount_total\"],\"limit\":50}"
