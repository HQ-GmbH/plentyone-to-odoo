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
# C005
#
# Odoo-Pendant:
# odoo/C005-product-unlink.sh
#
# Shopware-Pendant:
# shopware/C005-product-unlink.sh
#
# Beschreibung:
# Loescht eine Variation.
#
# Migrationshinweis:
# Loescht nur die Variation. Um den gesamten Artikel (Item) samt aller
# Variationen zu entfernen: DELETE /rest/items/{itemId}.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${ITEM_ID:?Export ITEM_ID=<Item-ID>}"
: "${VARIATION_ID:?Export VARIATION_ID=<Variations-ID>}"
curl -sS -X DELETE "${PLENTY_URL%/}/rest/items/${ITEM_ID}/variations/${VARIATION_ID}" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

