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
# A022
#
# Odoo-Pendant:
# odoo/A022-name_search.sh
#
# Shopware-Pendant:
# shopware/A022-name_search.sh
#
# Beschreibung:
# Fuehrt eine unscharfe Namenssuche ueber Volltext durch.
#
# Migrationshinweis:
# nameOrId ist der naheliegendste Ersatz fuer Odoos name_search() (kombinierte
# Suche nach Name ODER ID).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/accounts/contacts?nameOrId=Company&itemsPerPage=10" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

