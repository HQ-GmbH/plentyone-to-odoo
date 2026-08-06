#!/usr/bin/env bash
###############################################################################
# Odoo 19 JSON-2 API Reference
# PlentyOne -> Odoo 19 Enterprise Migration
# Copyright (c) 2026 HQ GmbH — https://www.hqgmbh.de
# Repository: https://github.com/hqgmbh/plentyone-to-odoo
# SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/G012-account-move-lines.sh
#
# Shopware-Pendant:
# shopware/G012-account-move-lines.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################
source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
set -euo pipefail
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/account.move.line/search_read" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d '{"domain":[],"fields":["move_id","account_id","partner_id","debit","credit","balance"],"limit":50}'
