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
# C002
#
# Odoo-Pendant:
# odoo/C002-product-create.sh
#
# Beschreibung:
# Legt einen neuen Artikel inkl. erster Variation an - zwei Schritte.
#
# Migrationshinweis:
# Odoo: product.template.create() legt Produkt+Verkaufspreis in EINEM Call an
# (list_price ist ein direktes Feld). Plenty: Item und Variation sind getrennte
# Ressourcen; der Verkaufspreis ist wiederum eine eigene Unterressource
# (variationSalesPrices, siehe C011), Steuersatz ueber vatId an der Variation.
# Ein vollstaendiges 'Produkt anlegen' braucht bei Plenty typischerweise 3+
# Calls (Item, Variation, Sales Price).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

TEST_SKU="${TEST_SKU:-C002-$(date +%s)}"

# Schritt 1: Item (Artikel-Stammdatensatz) anlegen
ITEM_RESPONSE=$(curl -sS -X POST "${PLENTY_URL%/}/rest/items" -H "Content-Type: application/json" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" -d '{"itemType":"VARIATION"}')
echo "${ITEM_RESPONSE}"
NEW_ITEM_ID=$(echo "${ITEM_RESPONSE}" | jq -r '.id')

# Schritt 2: Variation mit SKU (number), Einheit und Preis anlegen
curl -sS -X POST "${PLENTY_URL%/}/rest/items/${NEW_ITEM_ID}/variations" -H "Content-Type: application/json" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" -d "{\"number\":\"${TEST_SKU}\",\"unit\":{\"unitId\":1,\"content\":1},\"valueId\":0,\"isActive\":true}"

