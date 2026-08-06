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
# F001
#
# Odoo-Pendant:
# odoo/F001-stock-picking-search.sh
#
# Shopware-Pendant:
# shopware/F001-stock-picking-search.sh
#
# Beschreibung:
# Listet Bestandsbewegungen eines Lagers (naechste Entsprechung zu
# stock.picking).
#
# Migrationshinweis:
# GROSSER KONZEPTUNTERSCHIED: Odoo hat ein zweistufiges Modell (stock.picking =
# Transfer-BELEG mit Status draft/waiting/assigned/done, stock.move = einzelne
# Produktbewegung DARIN). Plenty kennt kein Belegkonzept mit Vorab-
# Reservierung/Freigabe-Workflow - Buchungen
# (bookIncomingItems/bookOutgoingItems) sind ATOMAR und sofort final. Die
# Bewegungshistorie (stock/movements) ist rein protokollierend, kein
# bearbeitbares Dokument.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${WAREHOUSE_ID:?Export WAREHOUSE_ID=<Lager-ID>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/stockmanagement/warehouses/${WAREHOUSE_ID}/stock/movements?itemsPerPage=20" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

