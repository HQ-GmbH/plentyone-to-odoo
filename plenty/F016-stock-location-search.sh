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
# F016
#
# Odoo-Pendant:
# odoo/F016-stock-location-search.sh
#
# Shopware-Pendant:
# shopware/F016-stock-location-search.sh
#
# Beschreibung:
# Listet die Lagerplatzstruktur eines Lagers.
#
# Migrationshinweis:
# Odoos stock.location bildet eine BELIEBIG TIEFE Baumstruktur (Firma > Lager >
# Zone > Regal > Fach) generisch als eigenes Modell ab. Plenty modelliert
# Lagerplaetze als feste Struktur (Dimensionen/Ebenen) UNTERHALB eines
# Warehouse, nicht als generischer Location-Baum.
#
# Hinweis: F018/F019 wurden von /rest/warehouses auf
# /rest/stockmanagement/warehouses umgestellt, da der alte Namespace gegen
# eine echte Instanz nicht erreichbar war (siehe dort). Dieses Skript nutzt
# weiterhin /rest/warehouses/structure, da dafuer kein Pfad unter
# /rest/stockmanagement/warehouses dokumentiert ist.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${WAREHOUSE_ID:?Export WAREHOUSE_ID=<Lager-ID>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/warehouses/structure/${WAREHOUSE_ID}" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

