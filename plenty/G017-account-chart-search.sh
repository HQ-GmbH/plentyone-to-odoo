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
# G017
#
# Odoo-Pendant:
# odoo/G017-account-chart-search.sh
#
# Shopware-Pendant:
# shopware/G017-account-chart-search.sh
#
# Beschreibung:
# Naeherung: listet die Kontenzuordnung fuer den Buchhaltungsexport.
#
# Migrationshinweis:
# Das ist eine EXPORT-MAPPING-Konfiguration (welches externe Konto bekommt
# welche Umsatzart zugeordnet, z.B. fuer DATEV), KEIN vollstaendiger Kontenplan
# mit Salden wie Odoos account.account. Fuer ein Migrationstool: Wenn ein
# echter Kontenplan mit Salden benoetigt wird, muss dieser aus dem externen
# Buchhaltungssystem stammen, nicht aus Plenty.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/accounting/locations/posting_accounts?itemsPerPage=50" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

