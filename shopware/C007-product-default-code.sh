#!/usr/bin/env bash
###############################################################################
# Shopware 6.7 Admin API Reference
#
# Companion Repository zum Referenzwerk
# "PlentyOne → Odoo 19 Enterprise Migration"
#
# Copyright (c) 2026 HQ GmbH
# https://www.hqgmbh.de
#
# Repository
# https://github.com/hqgmbh/plenty-erp2odoo
#
# SPDX-License-Identifier: Apache-2.0
#
# Reviewed by:
# Christopher Einenkel
#
# Test-ID:
# C007
#
# Odoo-Pendant:
# odoo/C007-product-default-code.sh
#
# Plenty-Pendant:
# plenty/C007-product-default-code.sh
#
# Beschreibung:
# Sucht ein Produkt per exakter Artikelnummer (SKU).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${DEFAULT_CODE:?Export DEFAULT_CODE=<Artikelnummer>}"
curl -sS -X POST "${SHOPWARE_URL%/}/api/search/product" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d "{\"filter\":[{\"type\":\"equals\",\"field\":\"productNumber\",\"value\":\"${DEFAULT_CODE}\"}]}"

