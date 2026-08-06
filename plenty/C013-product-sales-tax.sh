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
# C013
#
# Odoo-Pendant:
# odoo/C013-product-sales-tax.sh
#
# Shopware-Pendant:
# shopware/C013-product-sales-tax.sh
#
# Beschreibung:
# Liest den Steuersatz (vatId) einer Variation.
#
# Migrationshinweis:
# GET /rest/items/variations unterstuetzt KEINEN serverseitigen vatId-Filter
# (nicht in der Parameterliste der Spec enthalten) - anders als bei Odoos
# domain=[('taxes_id','in',[...])]. Eine Liste 'alle Artikel mit Steuersatz X'
# erfordert vollstaendiges Laden + clientseitiges Filtern.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${ITEM_ID:?Export ITEM_ID=<Item-ID>}"
: "${VARIATION_ID:?Export VARIATION_ID=<Variations-ID>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/items/${ITEM_ID}/variations/${VARIATION_ID}" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" | jq '{id, vatId}'

