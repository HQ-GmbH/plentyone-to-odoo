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
# plenty/C019-product-pagination.sh
#
# Shopware-Pendant:
# shopware/C019-product-pagination.sh
#
# Reviewed by:
# Lukas Ehrenberg
###############################################################################

source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.
set -euo pipefail
: "${ODOO_URL:?ODOO_URL must be set in config.sh}"; : "${ODOO_API_KEY:?ODOO_API_KEY must be set in config.sh}"
LIMIT="${LIMIT:-50}"; OFFSET="${OFFSET:-0}"
curl --silent --show-error --fail-with-body -X POST "${ODOO_URL%/}/json/2/product.template/search_read" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"domain\":[],\"fields\":[\"id\",\"name\",\"default_code\"],\"limit\":${LIMIT},\"offset\":${OFFSET},\"order\":\"id asc\"}"
