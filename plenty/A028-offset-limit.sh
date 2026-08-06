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
# A028
#
# Odoo-Pendant:
# odoo/A028-offset-limit.sh
#
# Shopware-Pendant:
# shopware/A028-offset-limit.sh
#
# Beschreibung:
# Zweite Ergebnisseite mit 20 Eintraegen (page=2 entspricht offset=20 bei
# limit=20).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/accounts/contacts?page=2&itemsPerPage=20" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

