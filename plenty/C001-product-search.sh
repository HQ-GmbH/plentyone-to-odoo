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
# C001
#
# Odoo-Pendant:
# odoo/C001-product-search.sh
#
# Shopware-Pendant:
# shopware/C001-product-search.sh
#
# Beschreibung:
# Listet Variationen (verkaufbare Artikeleinheiten) ohne Filter.
#
# Migrationshinweis:
# Plenty trennt Item (Artikel-Stammdatensatz/'Familie') und Variation (die
# eigentliche verkaufbare Einheit mit SKU, Preis, Lagerbestand). Odoos
# product.template entspricht eher der Variation als dem Item - die meisten
# C-Serie-Tests arbeiten daher gegen /rest/items/variations.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/items/variations?itemsPerPage=10" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

