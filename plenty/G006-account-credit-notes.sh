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
# G006
#
# Odoo-Pendant:
# odoo/G006-account-credit-notes.sh
#
# Beschreibung:
# Listet Gutschriften (orderType=4 'Credit note').
#
# Migrationshinweis:
# Guter direkter Treffer: Plenty modelliert Gutschriften wie Verkaufsauftraege
# auch als eigenen Order-Typ (typeId=4), aehnlich Odoos move_type in
# ('out_refund','in_refund') - allerdings als Auftragsdokument, nicht als
# Buchungssatz (siehe G001).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/orders?orderType=4&itemsPerPage=50" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

