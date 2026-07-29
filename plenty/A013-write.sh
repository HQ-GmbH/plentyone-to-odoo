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
# A013
#
# Odoo-Pendant:
# odoo/A013-write.sh
#
# Shopware-Pendant:
# shopware/A013-write.sh
#
# Beschreibung:
# Aktualisiert die E-Mail-Option eines bestehenden Kontakts.
#
# Migrationshinweis:
# Das offiziell dokumentierte PUT-Schema fuer /rest/accounts/contacts/{id}
# akzeptiert laut OpenAPI-Spec nur 'title' und 'options' - deutlich weniger als
# das, was Odoos write() auf res.partner erlaubt (fast beliebige Felder).
# Stammdaten wie Name/Adresse werden ueber die separaten Addresses-Endpunkte
# geaendert (siehe B004).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${CONTACT_ID:?Export CONTACT_ID=<Kontakt-ID>}"
curl -sS -X PUT "${PLENTY_URL%/}/rest/accounts/contacts/${CONTACT_ID}" -H "Content-Type: application/json" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" -d '{"options":[{"typeId":2,"subTypeId":1,"value":"json2-test-updated@example.com"}]}'

