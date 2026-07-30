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
# F006
#
# Odoo-Pendant:
# odoo/F006-stock-picking-internal.sh
#
# Shopware-Pendant:
# shopware/F006-stock-picking-internal.sh
#
# Beschreibung:
# Verlagert Bestand zwischen zwei Lagern (interne Umlagerung).
#
# Migrationshinweis:
# Odoos picking_type_code='internal' (Lager-zu-Lager-Transfer als eigener
# Belegtyp) entspricht hier am ehesten dem Order-Typ 'Redistribution'
# (typeId=15) bzw. diesem direkten Stock-Endpunkt.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${VARIATION_ID:?Export VARIATION_ID=<Variations-ID>}"
: "${WAREHOUSE_ID:?Export WAREHOUSE_ID=<Quell-Lager-ID>}"
: "${TARGET_WAREHOUSE_ID:?Export TARGET_WAREHOUSE_ID=<Ziel-Lager-ID>}"
curl -sS -X PUT "${PLENTY_URL%/}/rest/stockmanagement/stock/redistribute" -H "Content-Type: application/json" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" -d "{\"variationId\":${VARIATION_ID},\"quantity\":1,\"warehouseId\":${WAREHOUSE_ID},\"targetWarehouseId\":${TARGET_WAREHOUSE_ID}}"

