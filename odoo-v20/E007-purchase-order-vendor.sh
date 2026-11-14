#!/usr/bin/env bash
###############################################################################
# Odoo 20 JSON-2 API Reference
# Technisches Referenzwerk: PlentyONE → Odoo 19 mit Shopware 6
# Copyright (c) 2026 HQ GmbH — https://www.hqgmbh.de
# Repository: https://github.com/hqgmbh/plentyone-to-odoo
# SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/E007-purchase-order-vendor.sh
#
# Shopware-Pendant:
# shopware/E007-purchase-order-vendor.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################
source "$(dirname "${BASH_SOURCE[0]}")/_json2_common.sh"
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Beispiel: VENDOR_ID=123 ./E007-purchase-order-vendor.sh
set -euo pipefail
: "${VENDOR_ID:?Export VENDOR_ID=<res.partner supplier id>}"
odoo_require_id VENDOR_ID
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/purchase.order/search_read" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"domain\":[[\"partner_id\",\"=\",${VENDOR_ID}]],\"fields\":[\"id\",\"name\",\"state\",\"amount_total\"],\"limit\":50}"
