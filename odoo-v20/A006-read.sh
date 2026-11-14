#!/usr/bin/env bash
###############################################################################
# Odoo 20 JSON-2 API Reference
# Companion Repository: https://github.com/hqgmbh/plentyone-to-odoo
# Copyright (c) 2026 HQ GmbH
# SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/A006-read.sh
#
# Shopware-Pendant:
# shopware/A006-read.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################

source "$(dirname "${BASH_SOURCE[0]}")/_json2_common.sh"
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Optional: PARTNER_ID, Standardwert 1.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

PARTNER_ID="${PARTNER_ID:-1}"
odoo_require_id PARTNER_ID
curl -X POST "${ODOO_URL}/json/2/res.partner/read" -H "Authorization: Bearer ${ODOO_API_KEY}" -H "Content-Type: application/json" -d '{"ids":['"${PARTNER_ID}"'],"fields":["name","email"]}'
