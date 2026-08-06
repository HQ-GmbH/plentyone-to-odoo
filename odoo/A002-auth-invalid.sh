#!/usr/bin/env bash
###############################################################################
# Odoo 19 JSON-2 API Reference
# Companion Repository: https://github.com/hqgmbh/plentyone-to-odoo
# Copyright (c) 2026 HQ GmbH
# SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/A002-auth-invalid.sh
#
# Shopware-Pendant:
# shopware/A002-auth-invalid.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################

source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -X POST "${ODOO_URL}/json/2/res.partner/search_read" -H "Authorization: Bearer INVALID" -H "Content-Type: application/json" -d '{"domain":[]}'
