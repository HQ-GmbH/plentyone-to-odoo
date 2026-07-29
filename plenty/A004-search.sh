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
# A004
#
# Odoo-Pendant:
# odoo/A004-search.sh
#
# Beschreibung:
# Listet Kontakte ohne Filter (Basis-Suche).
#
# Migrationshinweis:
# Plenty kennt kein separates search() fuer reine IDs. Jede Liste liefert immer
# vollstaendige Objekte -> search() und search_read() fallen im REST-Modell
# zusammen.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/accounts/contacts?itemsPerPage=5" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

