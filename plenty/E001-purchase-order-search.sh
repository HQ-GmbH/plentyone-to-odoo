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
# E001
#
# Odoo-Pendant:
# odoo/E001-purchase-order-search.sh
#
# Beschreibung:
# Listet Nachbestellungen/Einkaufsauftraege (orderType=12 'Reorder').
#
# Migrationshinweis:
# WICHTIGE KORREKTUR gegenueber einer naheliegenden Annahme: Es gibt KEINEN
# einzelnen 'Purchase Order'-typeId. Plenty nennt den Einkaufs-auftrag
# 'Reorder' (Nachbestellung, typeId=12) mit eigenen Endpunkten unter
# /rest/reorders. Ein zweiter einkaufsnaher Typ ist 'Redistribution'
# (typeId=15, Lagerumlagerung) - fachlich naeher an einem internen Transfer als
# an einer Lieferantenbestellung.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/orders?orderType=12&itemsPerPage=20" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

