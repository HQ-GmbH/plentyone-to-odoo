#!/usr/bin/env bash
###############################################################################
# Odoo 20 JSON-2 API Reference
# Technisches Referenzwerk: PlentyONE → Odoo 19 mit Shopware 6
# Copyright (c) 2026 HQ GmbH — https://www.hqgmbh.de
# Repository: https://github.com/hqgmbh/plentyone-to-odoo
# SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/G001-account-move-search.sh
#
# Shopware-Pendant:
# shopware/G001-account-move-search.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################
source "$(dirname "${BASH_SOURCE[0]}")/_json2_common.sh"
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
set -euo pipefail
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/account.move/search_read" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d '{"domain":[["move_type","in",["out_invoice","in_invoice"]]],"fields":["id","name","move_type","partner_id","state","amount_total"],"limit":20}'
