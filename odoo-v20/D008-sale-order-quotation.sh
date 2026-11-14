#!/usr/bin/env bash
###############################################################################
# Odoo 20 JSON-2 API Reference
#
# Technisches Referenzwerk: PlentyONE → Odoo 19 mit Shopware 6
#
# Copyright (c) 2026 HQ GmbH
# https://www.hqgmbh.de
#
# Repository:
# https://github.com/hqgmbh/plentyone-to-odoo
#
# SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/D008-sale-order-quotation.sh
#
# Shopware-Pendant:
# shopware/D008-sale-order-quotation.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################

source "$(dirname "${BASH_SOURCE[0]}")/_json2_common.sh"
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.
set -euo pipefail
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/sale.order/search_read" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d '{"domain":[["state","in",["draft","sent"]]],"fields":["id","name","partner_id","state","amount_total"],"limit":50}'
