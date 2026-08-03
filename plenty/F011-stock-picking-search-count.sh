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
# F011
#
# Odoo-Pendant:
# odoo/F011-stock-picking-search-count.sh
#
# Shopware-Pendant:
# shopware/F011-stock-picking-search-count.sh
#
# Beschreibung:
# Ermittelt die Gesamtanzahl der Bestandsbewegungen eines Lagers.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${WAREHOUSE_ID:?Export WAREHOUSE_ID=<Lager-ID>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/stockmanagement/warehouses/${WAREHOUSE_ID}/stock/movements?itemsPerPage=1" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" | jq '.totalsCount'

