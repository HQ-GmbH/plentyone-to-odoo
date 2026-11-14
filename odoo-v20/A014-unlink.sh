#!/usr/bin/env bash
###############################################################################
# Odoo 20 JSON-2 API Reference
# Companion Repository: https://github.com/hqgmbh/plentyone-to-odoo
# Copyright (c) 2026 HQ GmbH
# SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/A014-unlink.sh
#
# Shopware-Pendant:
# shopware/A014-unlink.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################

source "$(dirname "${BASH_SOURCE[0]}")/_json2_common.sh"
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

# Nur Test-Partner löschen.
: "${PARTNER_ID:?Export PARTNER_ID=<res.partner id>}"
odoo_require_id PARTNER_ID
curl -X POST "${ODOO_URL}/json/2/res.partner/unlink" -H "Content-Type: application/json" -H "Authorization: Bearer ${ODOO_API_KEY}" -d '{"ids":['"${PARTNER_ID}"']}'
