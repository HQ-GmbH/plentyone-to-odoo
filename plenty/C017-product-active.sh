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
# C017
#
# Odoo-Pendant:
# odoo-v20/C017-product-active.sh
#
# Shopware-Pendant:
# shopware/C017-product-active.sh
#
# Beschreibung:
# Aktiviert eine Variation.
#
# Migrationshinweis:
# Anders als bei Contacts (siehe B017) gibt es bei Variationen SEHR WOHL ein
# isActive-Flag - das active/archived-Konzept existiert bei Plenty also nicht
# global, sondern nur bei einzelnen Ressourcen (hier: ja, bei Contacts: nein).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${ITEM_ID:?Export ITEM_ID=<Item-ID>}"
: "${VARIATION_ID:?Export VARIATION_ID=<Variations-ID>}"
curl -sS -X PUT "${PLENTY_URL%/}/rest/items/${ITEM_ID}/variations/${VARIATION_ID}" -H "Content-Type: application/json" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" -d '{"isActive":true}'

