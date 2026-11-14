#!/usr/bin/env bash
###############################################################################
# Odoo 20 JSON-2 API Reference
# Companion Repository: https://github.com/hqgmbh/plentyone-to-odoo
# Copyright (c) 2026 HQ GmbH
# SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/A001-auth-valid.sh
#
# Shopware-Pendant:
# shopware/A001-auth-valid.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################

source "$(dirname "${BASH_SOURCE[0]}")/_json2_common.sh"
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -X POST "${ODOO_URL}/json/2/res.partner/search_read" -H "Content-Type: application/json" -H "Authorization: Bearer ${ODOO_API_KEY}" -d '{"domain":[],"limit":1}'
