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
# A008
#
# Odoo-Pendant:
# odoo/A008-order.sh
#
# Beschreibung:
# Sortiert Kontakte clientseitig nach Vorname (kein serverseitiges order=).
#
# Migrationshinweis:
# GET /rest/accounts/contacts kennt keinen sortBy/order-Parameter (anders als
# z.B. /rest/orders/search, das sortBy/sortOrder unterstuetzt). Sortierung muss
# fuer Contacts clientseitig erfolgen.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/accounts/contacts?itemsPerPage=10" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" | jq '.entries |= sort_by(.firstName)'

