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
# plenty/C002-product-create.sh
#
# Shopware-Pendant:
# shopware/C002-product-create.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################

source "$(dirname "${BASH_SOURCE[0]}")/_json2_common.sh"
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.
set -euo pipefail
: "${ODOO_URL:?ODOO_URL must be set in config.sh}"
: "${ODOO_API_KEY:?ODOO_API_KEY must be set in config.sh}"
TEST_SKU="${TEST_SKU:-C002-$(date +%s)}"
TEST_SKU_JSON="$(odoo_json_string "${TEST_SKU}")"
curl --silent --show-error --fail-with-body -X POST "${ODOO_URL%/}/json/2/product.template/create" \
  -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" \
  -d "{\"vals_list\":[{\"name\":\"JSON-2 API test product\",\"default_code\":${TEST_SKU_JSON},\"type\":\"consu\",\"list_price\":19.99}]}"
