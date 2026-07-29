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
# B004
#
# Odoo-Pendant:
# odoo/B004-partner-write.sh
#
# Beschreibung:
# Aktualisiert den Namen ueber die primaere Adresse eines Kontakts.
#
# Migrationshinweis:
# Odoos write() auf res.partner aendert Name/E-Mail direkt auf dem Partner-
# Datensatz. Bei Plenty liegt der Name auf der Adresse, die E-Mail in den
# Contact-Options (siehe A013) - eine 'einfache Namensaenderung' beruehrt bei
# Plenty eine andere Ressource als bei Odoo.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${CONTACT_ID:?Export CONTACT_ID=<Kontakt-ID>}"
: "${ADDRESS_ID:?Export ADDRESS_ID=<Adress-ID des Kontakts>}"
curl -sS -X PUT "${PLENTY_URL%/}/rest/accounts/contacts/${CONTACT_ID}/addresses/${ADDRESS_ID}" -H "Content-Type: application/json" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" -d '{"name2":"JSON2 Testpartner (aktualisiert)"}'

