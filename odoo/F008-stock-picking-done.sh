#!/usr/bin/env bash
###############################################################################
# Odoo 19 JSON-2 API Reference
# PlentyOne -> Odoo 19 Enterprise Migration
# Copyright (c) 2026 HQ GmbH — https://www.hqgmbh.de
# Repository: https://github.com/hqgmbh/plentyone-to-odoo
# SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/F008-stock-picking-done.sh
#
# Shopware-Pendant:
# shopware/F008-stock-picking-done.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################
source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
set -euo pipefail
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/stock.picking/search_read" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d '{"domain":[["state","=","done"]],"fields":["name","date_done","origin"],"limit":50}'
