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
# https://github.com/hqgmbh/plenty-erp2odoo
#
# SPDX-License-Identifier: Apache-2.0
#
# Reviewed by:
# Lukas Ehrenberg
#
# Test-ID:
# C012
#
# Odoo-Pendant:
# odoo/C012-product-standard-price.sh
#
# Shopware-Pendant:
# shopware/C012-product-standard-price.sh
#
# Beschreibung:
# Liest den Einkaufspreis einer Variation.
#
# Migrationshinweis:
# purchasePrice liegt direkt am Variation-Objekt (anders als der Verkaufspreis,
# der in einer eigenen Unterressource liegt, siehe C011).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${ITEM_ID:?Export ITEM_ID=<Item-ID>}"
: "${VARIATION_ID:?Export VARIATION_ID=<Variations-ID>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/items/${ITEM_ID}/variations/${VARIATION_ID}" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" | jq '{id, purchasePrice}'

