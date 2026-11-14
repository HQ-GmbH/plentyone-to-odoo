#!/usr/bin/env bash
###############################################################################
# Plenty REST API Reference
#
# Companion Repository zum
# "Technischen Referenzwerk: PlentyONE → Odoo 19 mit Shopware 6"
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
# A009
#
# Odoo-Pendant:
# odoo-v20/A009-pagination.sh
#
# Shopware-Pendant:
# shopware/A009-pagination.sh
#
# Beschreibung:
# Demonstriert Pagination ueber page/itemsPerPage.
#
# Migrationshinweis:
# Odoo: offset+limit (0-basiert). Plenty: page+itemsPerPage (1-basiert).
# Umrechnung im Migrationstool: page = floor(offset/limit) + 1.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/accounts/contacts?page=2&itemsPerPage=10" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

