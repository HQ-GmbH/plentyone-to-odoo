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
# A020
#
# Odoo-Pendant:
# odoo/A020-search-count.sh
#
# Shopware-Pendant:
# shopware/A020-search-count.sh
#
# Beschreibung:
# Ermittelt die Gesamtanzahl aller Kontakte.
#
# Migrationshinweis:
# Kein dedizierter search_count()-Endpunkt. Die Gesamtzahl steckt im
# Pagination-Envelope (totalsCount) jeder normalen Listen-Antwort.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/accounts/contacts?itemsPerPage=1" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" | jq '.totalsCount'

