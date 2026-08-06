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
# A001
#
# Odoo-Pendant:
# odoo/A001-auth-valid.sh
#
# Shopware-Pendant:
# shopware/A001-auth-valid.sh
#
# Beschreibung:
# Fuehrt einen gueltigen Login durch und ruft anschliessend Kontakte ab.
#
# Migrationshinweis:
# Odoo nutzt einen statischen API-Key. Plenty tauscht Benutzername/Passwort
# gegen einen 24h gueltigen Bearer-Token (POST /rest/login), siehe _login.sh.
# Fuer ein Migrationstool bedeutet das: Token-Erneuerung und ein Limit von
# i.d.R. 3 gleichzeitigen Backend-Logins muessen eingeplant werden.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/accounts/contacts?itemsPerPage=1" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

