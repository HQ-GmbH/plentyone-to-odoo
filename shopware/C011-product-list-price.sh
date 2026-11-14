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
# C011
#
# Odoo-Pendant:
# odoo-v20/C011-product-list-price.sh
#
# Plenty-Pendant:
# plenty/C011-product-list-price.sh
#
# Beschreibung:
# Liest die Verkaufspreise eines Produkts.
#
# Migrationshinweis:
# Direkter am Produkt gespeichertes Feld (Array je Waehrung) - kein separater
# API-Call wie bei Plenty (variationSalesPrices als eigene Unterressource)
# notwendig, dafuer aber ein Array statt eines Skalarwerts wie bei Odoo.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${PRODUCT_ID:?Export PRODUCT_ID=<Produkt-UUID>}"
curl -sS -X GET "${SHOPWARE_URL%/}/api/product/${PRODUCT_ID}" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" | jq '{id, price}'

