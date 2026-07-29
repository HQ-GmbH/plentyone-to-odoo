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
# G008
#
# Odoo-Pendant:
# odoo/G008-account-posted-moves.sh
#
# Beschreibung:
# Naeherung: listet alle Zahlungstransaktionen (kein 'posted'-Filter
# verifiziert).
#
# Migrationshinweis:
# UNVERIFIZIERT: das Payment-Schema hat ein numerisches status-Feld, dessen
# konkrete Werte (welche Zahl bedeutet 'gebucht'?) in der Spec nicht als Enum
# dokumentiert sind. Bewusst OHNE Statusfilter ausgefuehrt, um keinen falschen
# Wert zu suggerieren - vor Nutzung gegen echte Instanz die tatsaechlichen
# Statuswerte ermitteln.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/payments/search?itemsPerPage=50" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

