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
# Reviewed by:
# Christopher Einenkel
#
# Test-ID:
# F014
#
# Odoo-Pendant:
# odoo/F014-stock-quant-search.sh
#
# Plenty-Pendant:
# plenty/F014-stock-quant-search.sh
#
# Beschreibung:
# Listet aktuelle Bestandszahlen mehrerer Produkte (Sparse Fieldset).
#
# Migrationshinweis:
# Grober Ersatz fuer stock.quant - liefert nur EINEN globalen Bestandswert je
# Produkt, keine Aufschluesselung nach Lagerort/-platz wie bei Odoo
# (stock.quant je location_id) oder Plenty (VariationStock je warehouseId).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X POST "${SHOPWARE_URL%/}/api/search/product" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d '{"fields":["id","productNumber","stock","availableStock"],"limit":50}'

