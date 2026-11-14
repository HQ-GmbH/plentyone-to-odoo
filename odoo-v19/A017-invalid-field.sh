#!/usr/bin/env bash
###############################################################################
# Odoo 19 JSON-2 API Reference
# Companion Repository: https://github.com/hqgmbh/plentyone-to-odoo
# Copyright (c) 2026 HQ GmbH
# SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/A017-invalid-field.sh
#
# Shopware-Pendant:
# shopware/A017-invalid-field.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################

source "$(dirname "${BASH_SOURCE[0]}")/_json2_common.sh"
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -X POST "${ODOO_URL}/json/2/res.partner/search_read" -H "Authorization: Bearer ${ODOO_API_KEY}" -H "Content-Type: application/json" -d '{"fields":["this_field_does_not_exist"]}'
