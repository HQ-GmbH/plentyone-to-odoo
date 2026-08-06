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
# D008
#
# Odoo-Pendant:
# odoo/D008-sale-order-quotation.sh
#
# Shopware-Pendant:
# shopware/D008-sale-order-quotation.sh
#
# Beschreibung:
# Listet Angebote (orderType=7 'Offer' - naechste Entsprechung zu draft/sent).
#
# Migrationshinweis:
# Odoos state in ('draft','sent') beschreibt einen NOCH NICHT bestaetigten
# Verkaufsauftrag (bleibt derselbe Datensatz). Plenty modelliert ein Angebot
# als EIGENEN Order-Typ (typeId=7, 'Offer'), nicht als Statuswert desselben
# Auftragstyps. Eine spaetere 'Umwandlung in Auftrag' ist damit ein strukturell
# anderer Vorgang als bei Odoo (ein neuer Order-Datensatz vom Typ 1 mit
# Referenz auf das Angebot, statt eines simplen Statuswechsels).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/orders?orderType=7&itemsPerPage=50" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

