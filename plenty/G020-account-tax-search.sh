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
# G020
#
# Odoo-Pendant:
# odoo/G020-account-tax-search.sh
#
# Shopware-Pendant:
# shopware/G020-account-tax-search.sh
#
# Beschreibung:
# Listet die konfigurierten Steuersaetze (VAT).
#
# Migrationshinweis:
# Direkter Treffer: /rest/vat entspricht weitgehend Odoos account.tax
# (Steuersatz-Stammdaten je Land). Anders als bei Odoo (ein account.tax = EIN
# Steuersatz) fasst ein Plenty-VAT-Datensatz laut Feldbeschreibung bis zu 4
# Steuersaetze pro Land/Konfiguration zusammen
# (Standard/reduziert/Sonderfaelle) - Detailstruktur der 4 Saetze liegt in
# einer Unterressource.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/vat?itemsPerPage=50" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

