#!/usr/bin/env bash
###############################################################################
# Shopware 6.7 Admin API Reference
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
# Christopher Einenkel
#
# Test-ID:
# C003
#
# Odoo-Pendant:
# odoo-v20/C003-product-read.sh
#
# Plenty-Pendant:
# plenty/C003-product-read.sh
#
# Beschreibung:
# Liest ein einzelnes Produkt.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${PRODUCT_ID:?Export PRODUCT_ID=<Produkt-UUID>}"
curl -sS -X GET "${SHOPWARE_URL%/}/api/product/${PRODUCT_ID}" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}"

