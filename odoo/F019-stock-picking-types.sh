#!/usr/bin/env bash
###############################################################################
# Odoo 19 JSON-2 API Reference
# PlentyOne -> Odoo 19 Enterprise Migration
# Copyright (c) 2026 HQ GmbH — https://www.hqgmbh.de
# Repository: https://github.com/hqgmbh/plentyone-to-odoo
# SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/F019-stock-picking-types.sh
#
# Shopware-Pendant:
# shopware/F019-stock-picking-types.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################
source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
set -euo pipefail
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/stock.picking.type/search_read" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d '{"domain":[],"fields":["id","name","code","warehouse_id"],"limit":50}'
