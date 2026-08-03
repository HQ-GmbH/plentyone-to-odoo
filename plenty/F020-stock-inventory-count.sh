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
# F020
#
# Odoo-Pendant:
# odoo/F020-stock-inventory-count.sh
#
# Shopware-Pendant:
# shopware/F020-stock-inventory-count.sh
#
# Beschreibung:
# Bucht eine Inventurzaehlung fuer eine Variation.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${WAREHOUSE_ID:?Export WAREHOUSE_ID=<Lager-ID>}"
: "${WAREHOUSE_LOCATION_ID:?Export WAREHOUSE_LOCATION_ID=<Lagerplatz-ID>}"
: "${VARIATION_ID:?Export VARIATION_ID=<Variations-ID>}"
curl -sS -X PUT "${PLENTY_URL%/}/rest/stockmanagement/warehouses/${WAREHOUSE_ID}/${WAREHOUSE_LOCATION_ID}/stock/bookStocktaking" -H "Content-Type: application/json" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" -d "{\"variationId\":${VARIATION_ID},\"quantity\":0}"

