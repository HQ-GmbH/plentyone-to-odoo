#!/usr/bin/env bash
###############################################################################
# Plenty REST API Reference
#
# Companion Repository zum
# "Technischen Referenzwerk: PlentyONE → Odoo 19 mit Shopware 6"
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
# C008
#
# Odoo-Pendant:
# odoo/C008-product-barcode.sh
#
# Shopware-Pendant:
# shopware/C008-product-barcode.sh
#
# Beschreibung:
# Sucht eine Variation per Barcode.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${BARCODE:?Export BARCODE=<Barcode>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/items/variations?barcode=${BARCODE}" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

