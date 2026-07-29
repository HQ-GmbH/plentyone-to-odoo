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
# A029
#
# Odoo-Pendant:
# odoo/A029-order-desc.sh
#
# Shopware-Pendant:
# shopware/A029-order-desc.sh
#
# Beschreibung:
# Sortiert Kontakte clientseitig absteigend nach Vorname.
#
# Migrationshinweis:
# Wie A008: kein serverseitiger order-Parameter fuer Contacts, daher
# absteigende Sortierung per jq nach dem Abruf.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/accounts/contacts?itemsPerPage=10" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" | jq '.entries |= (sort_by(.firstName) | reverse)'

