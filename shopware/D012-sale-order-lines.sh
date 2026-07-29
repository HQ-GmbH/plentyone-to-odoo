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
# D012
#
# Odoo-Pendant:
# odoo/D012-sale-order-lines.sh
#
# Plenty-Pendant:
# plenty/D012-sale-order-lines.sh
#
# Beschreibung:
# Listet die Positionen eines Auftrags.
#
# Migrationshinweis:
# order-line-item ist (anders als bei Plenty, wo orderItems nur ein
# eingebettetes Array ist) eine EIGENE, separat adressierbare Entity mit
# eigenem Suchendpunkt - naeher an Odoos sale.order.line als Plentys Modell.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${SALE_ORDER_ID:?Export SALE_ORDER_ID=<Auftrags-UUID>}"
curl -sS -X POST "${SHOPWARE_URL%/}/api/search/order-line-item" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d "{\"filter\":[{\"type\":\"equals\",\"field\":\"orderId\",\"value\":\"${SALE_ORDER_ID}\"}]}"

