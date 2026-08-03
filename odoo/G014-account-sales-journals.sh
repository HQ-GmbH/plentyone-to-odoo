#!/usr/bin/env bash
###############################################################################
# Odoo 19 JSON-2 API Reference
# PlentyOne -> Odoo 19 Enterprise Migration
# Copyright (c) 2026 HQ GmbH — https://www.hqgmbh.de
# Repository: https://github.com/hqgmbh/plenty-erp2odoo
# SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/G014-account-sales-journals.sh
#
# Shopware-Pendant:
# shopware/G014-account-sales-journals.sh
#
# Reviewed by:
# Lukas Ehrenberg
###############################################################################
source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
set -euo pipefail
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/account.journal/search_read" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d '{"domain":[["type","=","sale"]],"fields":["name","code","company_id"],"limit":50}'
