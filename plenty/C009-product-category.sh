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
# C009
#
# Odoo-Pendant:
# odoo/C009-product-category.sh
#
# Shopware-Pendant:
# shopware/C009-product-category.sh
#
# Beschreibung:
# Sucht Variationen einer bestimmten Kategorie.
#
# Migrationshinweis:
# In Plenty MUSS laut Doku jede Variation einer Kategorie vom Typ 'Item'
# zugeordnet sein - anders als bei Odoo, wo categ_id zwar Pflichtfeld ist, aber
# ueber eine simple Default-Kategorie automatisch erfuellt wird.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${CATEGORY_ID:?Export CATEGORY_ID=<Kategorie-ID>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/items/variations?categoryId=${CATEGORY_ID}&itemsPerPage=50" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

