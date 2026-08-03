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
# Reviewed by:
# Lukas Ehrenberg
#
# Test-ID:
# A027
#
# Odoo-Pendant:
# odoo/A027-not-in-domain.sh
#
# Shopware-Pendant:
# shopware/A027-not-in-domain.sh
#
# Beschreibung:
# Filtert Kontakte clientseitig aus, die NICHT in einer ID-Liste sind.
#
# Migrationshinweis:
# Kein serverseitiger 'not in'-Filter. Muss wie A026 clientseitig erfolgen -
# nach Abruf einer (ggf. vollstaendigen) Seite filtern.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

EXCLUDE_IDS="1,9"
curl -sS -X GET "${PLENTY_URL%/}/rest/accounts/contacts?itemsPerPage=10" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" | jq --arg ex "$EXCLUDE_IDS" '.entries |= map(select(([.id] | inside(($ex | split(",") | map(tonumber))) | not)))'

