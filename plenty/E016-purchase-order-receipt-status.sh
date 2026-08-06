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
# E016
#
# Odoo-Pendant:
# odoo/E016-purchase-order-receipt-status.sh
#
# Shopware-Pendant:
# shopware/E016-purchase-order-receipt-status.sh
#
# Beschreibung:
# Liest gebuchte Wareneingangs-Transaktionen einer Nachbestellung.
#
# Migrationshinweis:
# Wareneingaenge haengen NICHT an der Auftragsposition selbst: das Schema
# OrderItem besitzt kein receiptId-Feld. receiptId liegt ausschliesslich am
# Schema OrderItemTransaction, also eine Ebene tiefer - Positionen werden
# ueber Transaktionen (direction 'in'/'out') bebucht. Gelesen wird das mit
# GET /rest/orders/items/transactions?orderId=... (Filter isBooked verfuegbar).
# Ein aggregiertes receipt_status-Feld auf Auftragsebene wie bei Odoo
# (purchase.order.receipt_status) existiert nicht - der Gesamtstatus muss aus
# den Transaktionen clientseitig hergeleitet werden.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${PURCHASE_ORDER_ID:?Export PURCHASE_ORDER_ID=<Auftrags-ID>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/orders/items/transactions?orderId=${PURCHASE_ORDER_ID}" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" | jq '(.entries // .) | map({orderItemId, receiptId, quantity, direction, status})'

