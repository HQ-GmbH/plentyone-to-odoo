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
# A012
#
# Odoo-Pendant:
# odoo/A012-read.sh
#
# Shopware-Pendant:
# shopware/A012-read.sh
#
# Beschreibung:
# Liest einen Kontakt inkl. aller vorhandenen Felder.
#
# Migrationshinweis:
# Odoo waehlt fields=[...] gezielt aus (Netzwerk-Optimierung). Plenty liefert
# immer den gesamten Datensatz; Feldreduktion ist nur clientseitig (z.B. per
# jq) moeglich.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${CONTACT_ID:?Export CONTACT_ID=<Kontakt-ID>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/accounts/contacts/${CONTACT_ID}" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

