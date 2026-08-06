#!/usr/bin/env bash
###############################################################################
# Plenty REST API Reference
#
# Companion Repository zum Referenzwerk
# "PlentyOne → Odoo 19 Enterprise Migration"
#
# Copyright (c) 2026 HQ GmbH
# https://www.hqgmbh.de
#
# Repository
# https://github.com/hqgmbh/plentyone-to-odoo
#
# SPDX-License-Identifier: Apache-2.0
#
# Reviewed by:
# Lukas Ehrenberg
#
# Test-ID:
# C004
#
# Odoo-Pendant:
# odoo/C004-product-write.sh
#
# Shopware-Pendant:
# shopware/C004-product-write.sh
#
# Beschreibung:
# Aktualisiert den Namen einer Variation.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${ITEM_ID:?Export ITEM_ID=<Item-ID>}"
: "${VARIATION_ID:?Export VARIATION_ID=<Variations-ID>}"
curl -sS -X PUT "${PLENTY_URL%/}/rest/items/${ITEM_ID}/variations/${VARIATION_ID}" -H "Content-Type: application/json" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" -d '{"name":"JSON-2 API updated product"}'

