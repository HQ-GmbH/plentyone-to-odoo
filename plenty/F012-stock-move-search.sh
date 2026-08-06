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
# F012
#
# Odoo-Pendant:
# odoo/F012-stock-move-search.sh
#
# Shopware-Pendant:
# shopware/F012-stock-move-search.sh
#
# Beschreibung:
# Listet Bestandsbewegungen fuer eine bestimmte Variation.
#
# Migrationshinweis:
# Odoo trennt stock.picking (Beleg) und stock.move (Einzelbewegung DARIN) als
# zwei Modelle. Plenty hat nur EIN Konzept (movements) - F001 und F012 nutzen
# denselben Endpunkt, nur mit unterschiedlicher Filterung, statt zwei
# getrennter Modelle.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${WAREHOUSE_ID:?Export WAREHOUSE_ID=<Lager-ID>}"
: "${VARIATION_ID:?Export VARIATION_ID=<Variations-ID>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/stockmanagement/warehouses/${WAREHOUSE_ID}/stock/movements?variationId=${VARIATION_ID}&itemsPerPage=50" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

