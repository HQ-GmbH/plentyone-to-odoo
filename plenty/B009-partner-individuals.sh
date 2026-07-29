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
# B009
#
# Odoo-Pendant:
# odoo/B009-partner-individuals.sh
#
# Beschreibung:
# Listet Kontakte ohne verknuepfte Firmen-Accounts (Privatpersonen).
#
# Migrationshinweis:
# Kehrseite von B008 - siehe dortigen Hinweis.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/accounts/contacts?itemsPerPage=50&with=accounts" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" | jq '.entries |= map(select((.accounts | length) == 0))'

