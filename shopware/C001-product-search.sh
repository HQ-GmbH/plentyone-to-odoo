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
# C001
#
# Odoo-Pendant:
# odoo/C001-product-search.sh
#
# Plenty-Pendant:
# plenty/C001-product-search.sh
#
# Beschreibung:
# Listet Produkte ohne Filter.
#
# Migrationshinweis:
# Anders als bei Plenty (Item+Variation getrennt) ist Shopwares product-Entity
# ein einzelnes Modell fuer sowohl eigenstaendige Produkte als auch Varianten
# (ueber parentId/children abgebildet) - naeher an Odoos
# product.template/product.product-Struktur.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${SHOPWARE_URL%/}/api/product?limit=10" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}"

