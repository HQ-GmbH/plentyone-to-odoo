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
# F004
#
# Odoo-Pendant:
# odoo/F004-stock-picking-incoming.sh
#
# Shopware-Pendant:
# shopware/F004-stock-picking-incoming.sh
#
# Beschreibung:
# Bucht einen Wareneingang (reasonId=180 'Incoming items - purchase order').
#
# Migrationshinweis:
# Es gibt 11 vordefinierte reasonId-Werte allein fuer Wareneingaenge
# (101=Incoming items, 104=Rebooked, 109=Incoming items/logistics, 115=second
# choice, 180=purchase order, 181=warehousing, ...) - ein deutlich feinerer
# Buchungsgrund-Katalog als Odoos generisches stock.picking (incoming). Fuer
# die Migration muss jeder Wareneingang einem passenden reasonId zugeordnet
# werden.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${WAREHOUSE_ID:?Export WAREHOUSE_ID=<Lager-ID>}"
: "${VARIATION_ID:?Export VARIATION_ID=<Variations-ID>}"
curl -sS -X PUT "${PLENTY_URL%/}/rest/stockmanagement/warehouses/${WAREHOUSE_ID}/stock/bookIncomingItems" -H "Content-Type: application/json" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" -d "{\"variationId\":${VARIATION_ID},\"quantity\":1,\"reasonId\":180,\"deliveredAt\":\"$(date -u +%Y-%m-%dT%H:%M:%S%z)\"}"

