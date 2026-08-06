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
# C011
#
# Odoo-Pendant:
# odoo/C011-product-list-price.sh
#
# Shopware-Pendant:
# shopware/C011-product-list-price.sh
#
# Beschreibung:
# Liest die Verkaufspreise einer Variation.
#
# Migrationshinweis:
# Odoo: list_price ist ein einzelnes Feld am product.template. Plenty:
# variationSalesPrices ist eine 1:n-Relation (mehrere Preise moeglich, z.B. je
# Kundengruppe/Waehrung/Mindestmenge via salesPriceId).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${ITEM_ID:?Export ITEM_ID=<Item-ID>}"
: "${VARIATION_ID:?Export VARIATION_ID=<Variations-ID>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/items/${ITEM_ID}/variations/${VARIATION_ID}/variation_sales_prices" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

