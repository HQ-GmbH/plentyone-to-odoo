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
# Test-ID:
# C010
#
# Odoo-Pendant:
# odoo/C010-product-type.sh
#
# Beschreibung:
# Filtert Variationen nach Bundle-Status (naeherungsweise 'Produkttyp').
#
# Migrationshinweis:
# WICHTIGER KONZEPTUNTERSCHIED: Odoos detailed_type unterscheidet
# Ware/Dienstleistung/Kombireferenz (consu/service/combo). Plenty's itemType-
# Konzept auf Variationsebene unterscheidet stattdessen
# VARIATION/ITEM_BUNDLE/BUNDLE_COMPONENT (Einzelartikel vs. Set/Buendel vs.
# Set-Bestandteil) - eine ganz andere Achse. Plenty hat KEIN eingebautes
# Konzept fuer nicht-lagerhaltige Dienstleistungen; solche Positionen werden
# i.d.R. ausserhalb von Plenty (im ERP/Buchhaltungs-system) gefuehrt oder als
# Artikel ohne Lagerbuchung modelliert.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/items/variations?isBundle=true&itemsPerPage=50" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

