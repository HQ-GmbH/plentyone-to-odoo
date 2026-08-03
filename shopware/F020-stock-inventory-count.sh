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
# Lukas Ehrenberg
#
# Test-ID:
# F020
#
# Odoo-Pendant:
# odoo/F020-stock-inventory-count.sh
#
# Plenty-Pendant:
# plenty/F020-stock-inventory-count.sh
#
# Beschreibung:
# Korrigiert den Lagerbestand nach einer Inventurzaehlung (identisch zu F004:
# absolutes Setzen).
#
# Migrationshinweis:
# Keine dedizierte Inventur-/Stocktaking-Aktion wie bei Plenty
# (bookStocktaking) - eine Inventurkorrektur ist technisch identisch zu jedem
# anderen Bestands-PATCH (F004/F005).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${PRODUCT_ID:?Export PRODUCT_ID=<Produkt-UUID>}"
: "${COUNTED_STOCK:?Export COUNTED_STOCK=<gezaehlter Bestand>}"
curl -sS -X PATCH "${SHOPWARE_URL%/}/api/product/${PRODUCT_ID}" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d "{\"stock\":${COUNTED_STOCK}}"

