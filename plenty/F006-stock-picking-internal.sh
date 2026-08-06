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
#
# Zum Feldschema: die Lager heissen currentWarehouseId und newWarehouseId (NICHT
# warehouseId/targetWarehouseId). Pflichtfelder sind currentWarehouseId,
# newWarehouseId, quantity und das Array redistributions - die Umlagerung wird
# also als LISTE von Positionen uebergeben, nicht als einzelner Vorgang. Jeder
# Eintrag folgt dem Schema VariationStockRedistribution und kann die Lager je
# Position erneut setzen sowie optional Lagerplatz (currentStorageLocationId/
# newStorageLocationId), Charge (batch), MHD (bestBeforeDate) und Grund tragen.
#
# reasonId ist ein festes Vokabular: 401 Umlagerung, 402 Korrektur durch
# Inventur, 403 Umlagerung wegen Reparaturbedarf. Odoo kennt keine solche
# Grundcodierung am Transfer - fuer die Migration ggf. auf stock.picking.note
# oder ein eigenes Feld abbilden.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${VARIATION_ID:?Export VARIATION_ID=<Variations-ID>}"
: "${WAREHOUSE_ID:?Export WAREHOUSE_ID=<Quell-Lager-ID>}"
: "${TARGET_WAREHOUSE_ID:?Export TARGET_WAREHOUSE_ID=<Ziel-Lager-ID>}"
curl -sS -X PUT "${PLENTY_URL%/}/rest/stockmanagement/stock/redistribute" -H "Content-Type: application/json" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" -d "{\"currentWarehouseId\":${WAREHOUSE_ID},\"newWarehouseId\":${TARGET_WAREHOUSE_ID},\"quantity\":1,\"redistributions\":[{\"variationId\":${VARIATION_ID},\"quantity\":1,\"currentWarehouseId\":${WAREHOUSE_ID},\"newWarehouseId\":${TARGET_WAREHOUSE_ID},\"reasonId\":401}]}"

