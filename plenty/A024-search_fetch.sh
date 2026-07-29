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
# A024
#
# Odoo-Pendant:
# odoo/A024-search_fetch.sh
#
# Beschreibung:
# Listet Kontakte mit eingeschlossenen Relationen (entspricht dem
# search()+read()-Verhalten von search_fetch()).
#
# Migrationshinweis:
# search_fetch() ist Odoo 19's Verschmelzung von search()+read() in einem Call.
# Im Plenty-REST-Modell ist das der Normalfall (siehe A004/A005) - es gibt
# keine getrennte ID-only-Variante, gegen die man das abgrenzen koennte.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/accounts/contacts?itemsPerPage=10&with=addresses" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

