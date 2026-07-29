#!/usr/bin/env bash
###############################################################################
# Odoo 19 JSON-2 API Reference
# PlentyOne -> Odoo 19 Enterprise Migration
# Copyright (c) 2026 HQ GmbH — https://www.hqgmbh.de
# Repository: https://github.com/hqgmbh/plenty-erp2odoo
# SPDX-License-Identifier: Apache-2.0
#
# Plenty-Pendant:
# plenty/E007-purchase-order-vendor.sh
#
# Shopware-Pendant:
# shopware/E007-purchase-order-vendor.sh
###############################################################################
source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Beispiel: VENDOR_ID=123 ./E007-purchase-order-vendor.sh
set -euo pipefail
: "${VENDOR_ID:?Export VENDOR_ID=<res.partner supplier id>}"
curl -sS --fail-with-body -X POST "${ODOO_URL%/}/json/2/purchase.order/search_read" -H 'Content-Type: application/json' -H "Authorization: bearer ${ODOO_API_KEY}" -d "{\"domain\":[[\"partner_id\",\"=\",${VENDOR_ID}]],\"fields\":[\"id\",\"name\",\"state\",\"amount_total\"],\"limit\":50}"
