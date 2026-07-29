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
# Test-ID:
# C012
#
# Odoo-Pendant:
# odoo/C012-product-standard-price.sh
#
# Beschreibung:
# Liest den Einkaufspreis (Kostenpreis) eines Produkts.
#
# Migrationshinweis:
# purchasePrices existiert als eigenes Feld ("Actual/cost price of the
# product", ebenfalls ein Price-Array wie C011) - direkter Treffer fuer
# standard_price.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${PRODUCT_ID:?Export PRODUCT_ID=<Produkt-UUID>}"
curl -sS -X GET "${SHOPWARE_URL%/}/api/product/${PRODUCT_ID}" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" | jq '{id, purchasePrices}'

