#!/usr/bin/env bash
###############################################################################
# Odoo 19 JSON-2 API Reference
# PlentyOne -> Odoo 19 Enterprise Migration
# Copyright (c) 2026 HQ GmbH — https://www.hqgmbh.de
# Repository: https://github.com/hqgmbh/plenty-erp2odoo
# SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/D020-sale-order-date.sh
#
# Shopware-Pendant:
# shopware/D020-sale-order-date.sh
#
# Reviewed by:
# Lukas Ehrenberg
###############################################################################
# Optional: DATE_FROM im ISO-Format, Standardwert 2026-01-01.
source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.
set -euo pipefail
DATE_FROM="${DATE_FROM:-2026-01-01}"
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/sale.order/search_read" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"domain\":[[\"date_order\",\">=\",\"${DATE_FROM}\"]],\"fields\":[\"id\",\"name\",\"date_order\",\"amount_total\"],\"limit\":50}"
