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
# https://github.com/hqgmbh/plentyone-to-odoo
#
# SPDX-License-Identifier: Apache-2.0
#
# Reviewed by:
# Lukas Ehrenberg
#
# Test-ID:
# B008
#
# Odoo-Pendant:
# odoo/B008-partner-companies.sh
#
# Shopware-Pendant:
# shopware/B008-partner-companies.sh
#
# Beschreibung:
# Listet Kontakte mit verknuepften Firmen-Accounts.
#
# Migrationshinweis:
# Odoo unterscheidet is_company als eigenes Boolean-Feld direkt am Partner.
# Plenty hat kein solches Flag am Contact - 'Firma' ergibt sich erst daraus, ob
# ein Account (companyName) verknuepft ist. Der Filter muss daher clientseitig
# nach dem Laden erfolgen (kein Server-Parameter fuer 'hat Account').
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/accounts/contacts?itemsPerPage=50&with=accounts" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" | jq '.entries |= map(select(.accounts | length > 0))'

