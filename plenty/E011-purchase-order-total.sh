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
# E011
#
# Odoo-Pendant:
# odoo/E011-purchase-order-total.sh
#
# Shopware-Pendant:
# shopware/E011-purchase-order-total.sh
#
# Beschreibung:
# Berechnet die Bestellsumme clientseitig aus den Positionen.
#
# Migrationshinweis:
# Siehe D011 - dasselbe Fehlen eines gespeicherten Summenfeldes gilt auch fuer
# Reorders.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${PURCHASE_ORDER_ID:?Export PURCHASE_ORDER_ID=<Auftrags-ID>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/orders/${PURCHASE_ORDER_ID}?with=orderItems" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" | jq '{orderId: .id, total: ([.orderItems[]? | (.quantity * .price // 0)] | add)}'

