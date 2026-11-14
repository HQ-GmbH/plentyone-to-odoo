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
# A005
#
# Odoo-Pendant:
# odoo-v20/A005-search_read.sh
#
# Shopware-Pendant:
# shopware/A005-search_read.sh
#
# Beschreibung:
# Listet Kontakte inkl. Adress- und Firmen-Relationen (per ?with=).
#
# Migrationshinweis:
# Odoos search_read(fields=[...]) waehlt einzelne Felder aus. Plenty liefert
# immer das komplette Objekt; ?with=... blendet stattdessen zusaetzliche
# verknuepfte Relationen ein, statt Felder zu reduzieren.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/accounts/contacts?itemsPerPage=5&with=addresses,accounts" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

