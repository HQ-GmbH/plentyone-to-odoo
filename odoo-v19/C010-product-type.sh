#!/usr/bin/env bash
###############################################################################
# Odoo 19 JSON-2 API Reference
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
# plenty/C010-product-type.sh
#
# Shopware-Pendant:
# shopware/C010-product-type.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################

source "$(dirname "${BASH_SOURCE[0]}")/_json2_common.sh"
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.
set -euo pipefail
: "${ODOO_URL:?ODOO_URL must be set in config.sh}"; : "${ODOO_API_KEY:?ODOO_API_KEY must be set in config.sh}"
PRODUCT_TYPE="${PRODUCT_TYPE:-consu}"
PRODUCT_TYPE_JSON="$(odoo_json_string "${PRODUCT_TYPE}")"
curl --silent --show-error --fail-with-body -X POST "${ODOO_URL%/}/json/2/product.template/search_read" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"domain\":[[\"type\",\"=\",${PRODUCT_TYPE_JSON}]],\"fields\":[\"id\",\"name\",\"type\"],\"limit\":50}"
