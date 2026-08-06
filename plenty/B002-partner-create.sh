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
# B002
#
# Odoo-Pendant:
# odoo/B002-partner-create.sh
#
# Shopware-Pendant:
# shopware/B002-partner-create.sh
#
# Beschreibung:
# Legt einen neuen Firmenkontakt inkl. Adresse (Name) an - zwei Schritte.
#
# Migrationshinweis:
# Odoo: create() mit name+email+is_company in EINEM Call. Plenty benoetigt
# MINDESTENS zwei Calls (Contact + Address), da der Anzeigename kein direktes
# Feld des Contact-Objekts ist, sondern aus der (primaeren) Adresse stammt.
# Fuer eine echte Firma kaeme zusaetzlich ein dritter Call auf POST
# /rest/accounts (companyName) + Verknuepfung per POST
# .../contacts/{id}/accounts hinzu. Dies ist einer der wichtigsten
# strukturellen Unterschiede fuer das Migrationstool: Odoos res.partner ist ein
# monolithisches Modell, Plenty verteilt dieselben Informationen ueber
# Contact+Address(+Account).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

# Schritt 1: Kontakt anlegen (nur Typ + Referrer + E-Mail-Option)
CONTACT_RESPONSE=$(curl -sS -X POST "${PLENTY_URL%/}/rest/accounts/contacts" -H "Content-Type: application/json" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" -d '{"referrerId":1,"typeId":1,"options":[{"typeId":2,"subTypeId":1,"value":"json2-test@example.com"}]}')
echo "${CONTACT_RESPONSE}"
NEW_CONTACT_ID=$(echo "${CONTACT_RESPONSE}" | jq -r '.id')

# Schritt 2: Adresse mit Namen anlegen (name2=Vorname/Firma, name3=Nachname)
curl -sS -X POST "${PLENTY_URL%/}/rest/accounts/contacts/${NEW_CONTACT_ID}/addresses" -H "Content-Type: application/json" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" -d '{"countryId":1,"name2":"JSON2 Testpartner","town":"Musterstadt","postalCode":"12345","address1":"Teststrasse","address2":"1"}'

