#!/usr/bin/env bash
###############################################################################
# Odoo 19 JSON-2 API Reference
# Technisches Referenzwerk: PlentyONE → Odoo 19 mit Shopware 6
# Copyright (c) 2026 HQ GmbH — https://www.hqgmbh.de
# Repository: https://github.com/hqgmbh/plentyone-to-odoo
# SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/E002-purchase-order-create.sh
#
# Shopware-Pendant:
# shopware/E002-purchase-order-create.sh
#
# Reviewed by:
# Mathias Goldhan
###############################################################################
source "$(dirname "${BASH_SOURCE[0]}")/_json2_common.sh"
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Beispiel: VENDOR_ID=123 ./E002-purchase-order-create.sh  # Nur Testdaten.
set -euo pipefail
: "${VENDOR_ID:?Export VENDOR_ID=<res.partner supplier id>}"
odoo_require_id VENDOR_ID
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/purchase.order/create" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"vals_list\":[{\"partner_id\":${VENDOR_ID},\"partner_ref\":\"JSON-2 purchase test\"}]}"
