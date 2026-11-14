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
# plenty/C012-product-standard-price.sh
#
# Shopware-Pendant:
# shopware/C012-product-standard-price.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################

source "$(dirname "${BASH_SOURCE[0]}")/_json2_common.sh"
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.
set -euo pipefail
: "${ODOO_URL:?ODOO_URL must be set in config.sh}"; : "${ODOO_API_KEY:?ODOO_API_KEY must be set in config.sh}"; : "${PRODUCT_ID:?Export PRODUCT_ID=<product.template id>}"
odoo_require_id PRODUCT_ID
curl --silent --show-error --fail-with-body -X POST "${ODOO_URL%/}/json/2/product.template/read" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"ids\":[${PRODUCT_ID}],\"fields\":[\"id\",\"name\",\"standard_price\"]}"
