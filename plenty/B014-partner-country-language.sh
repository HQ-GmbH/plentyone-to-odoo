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
# B014
#
# Odoo-Pendant:
# odoo/B014-partner-country-language.sh
#
# Beschreibung:
# Zeigt Sprache (Contact) und Land (primaere Adresse) eines Kontakts.
#
# Migrationshinweis:
# lang liegt direkt am Contact, countryId dagegen an der Adresse - bei Odoo
# liegen beide Felder direkt am res.partner. Ein Migrationstool muss hier zwei
# Quellen zusammenfuehren.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${CONTACT_ID:?Export CONTACT_ID=<Kontakt-ID>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/accounts/contacts/${CONTACT_ID}?with=addresses" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" | jq '{lang: .lang, countryId: .addresses[0].countryId}'

