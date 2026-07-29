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
# G007
#
# Odoo-Pendant:
# odoo/G007-account-draft-moves.sh
#
# Beschreibung:
# Naeherung: Auftraege in fruehen (noch nicht abgeschlossenen) Status.
#
# Migrationshinweis:
# Odoos state='draft' bei account.move ist ein buchhalterischer Status (noch
# nicht gebucht, aenderbar). Da es keine Buchungssaetze gibt, ist dies nur eine
# sehr lose Naeherung ueber den Auftragsstatus, keine echte Entsprechung.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/orders?orderType=1&statusFrom=1&statusTo=2&itemsPerPage=50" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

