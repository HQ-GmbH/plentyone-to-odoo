#!/usr/bin/env bash
###############################################################################
# Shopware 6.7 Admin API Reference
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
# F003
#
# Odoo-Pendant:
# odoo/F003-stock-picking-fields_get.sh
#
# Plenty-Pendant:
# plenty/F003-stock-picking-fields_get.sh
#
# Beschreibung:
# Zeigt die im Schema vorhandenen, aber unverknuepften Warehouse-Definitionen
# (Beleg fuer den Commercial-Gate-Befund aus F001).
#
# Migrationshinweis:
# Im Core-Schema erwartet: warehouseSchemaExists=true,
# warehousePathExists=false - der direkte Nachweis, dass die Warehouse-
# Funktionalitaet strukturell vorbereitet, aber ohne Commercial-Plugin nicht
# erreichbar ist.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${SHOPWARE_URL%/}/api/_info/openapi3.json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" | jq '{warehouseSchemaExists: (.components.schemas.Warehouse != null), warehousePathExists: (.paths | keys | any(test("warehouse";"i")))}'

