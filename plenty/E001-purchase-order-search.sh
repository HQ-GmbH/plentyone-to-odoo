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
# E001
#
# Odoo-Pendant:
# odoo-v20/E001-purchase-order-search.sh
#
# Shopware-Pendant:
# shopware/E001-purchase-order-search.sh
#
# Beschreibung:
# Listet Nachbestellungen/Einkaufsauftraege (orderType=12 'Reorder').
#
# Migrationshinweis:
# WICHTIGE KORREKTUR gegenueber einer naheliegenden Annahme: Es gibt KEINEN
# einzelnen 'Purchase Order'-typeId. Plenty nennt den Einkaufs-auftrag
# 'Reorder' (Nachbestellung, typeId=12). Ein zweiter einkaufsnaher Typ ist
# 'Redistribution' (typeId=15, Lagerumlagerung) - fachlich naeher an einem
# internen Transfer als an einer Lieferantenbestellung.
# Das OpenAPI-Schema listet zusaetzlich einen eigenen Endpunkt-Namespace
# /rest/reorders - dieser war gegen eine echte Instanz jedoch nicht
# erreichbar. Dieses Repo verwendet daher durchgehend den generischen
# /rest/orders-Endpunkt mit orderType=12 (siehe E002-E016).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/orders?orderType=12&itemsPerPage=20" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

