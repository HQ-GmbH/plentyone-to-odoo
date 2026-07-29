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
# A011
#
# Odoo-Pendant:
# odoo/A011-create.sh
#
# Shopware-Pendant:
# shopware/A011-create.sh
#
# Beschreibung:
# Legt einen neuen Testkontakt an.
#
# Migrationshinweis:
# Odoo: create() mit name+email+is_company in einem Aufruf. Plenty: referrerId
# und typeId sind Pflicht, E-Mail wird ueber ein options[]-Array (typeId=2)
# gesetzt, NICHT als direktes email-Feld im Request-Body (obwohl das GET-
# Response spaeter ein email-Feld zeigt). Ein Anzeigename (Vor-/Nachname) wird
# erst ueber eine zugeordnete Adresse (name2/name3) oder einen Account
# (companyName) vergeben - siehe B002.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X POST "${PLENTY_URL%/}/rest/accounts/contacts" -H "Content-Type: application/json" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" -d '{"referrerId":1,"typeId":1,"options":[{"typeId":2,"subTypeId":1,"value":"json2-test@example.com"}]}'

