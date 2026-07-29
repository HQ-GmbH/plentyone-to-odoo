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
# B001
#
# Odoo-Pendant:
# odoo/B001-partner-search.sh
#
# Shopware-Pendant:
# shopware/B001-partner-search.sh
#
# Beschreibung:
# Sucht Kontakte per Volltextsuche nach einem Namensfragment.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/accounts/contacts?fullText=Company&itemsPerPage=10" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

