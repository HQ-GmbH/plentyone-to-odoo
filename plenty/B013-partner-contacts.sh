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
# B013
#
# Odoo-Pendant:
# odoo/B013-partner-contacts.sh
#
# Shopware-Pendant:
# shopware/B013-partner-contacts.sh
#
# Beschreibung:
# Listet alle Kontakte (Ansprechpartner) einer Firma (Account).
#
# Migrationshinweis:
# Odoo: res.partner mit parent_id != false (Kontakt haengt an Mutter-Firma
# innerhalb DESSELBEN Modells). Plenty: Contact und Account sind zwei getrennte
# Ressourcen, verbunden ueber eine n:m-Relation (AccountContactRelation) statt
# einer einfachen Self-Referenz.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${ACCOUNT_ID:?Export ACCOUNT_ID=<Account-ID der Firma>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/accounts/${ACCOUNT_ID}/contacts" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

