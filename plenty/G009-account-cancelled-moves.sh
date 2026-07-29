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
# G009
#
# Odoo-Pendant:
# odoo/G009-account-cancelled-moves.sh
#
# Beschreibung:
# Listet stornierte Verkaufsauftraege (statusId=8 'Storniert').
#
# Migrationshinweis:
# statusId=8 (Storniert) ist im Handbuch als fester, mit Systemautomatik
# verknuepfter Status dokumentiert - einer der wenigen zuverlaessig belegten
# konkreten Status-IDs.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/orders?orderType=1&statusFrom=8&statusTo=8&itemsPerPage=50" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

