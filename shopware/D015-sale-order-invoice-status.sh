#!/usr/bin/env bash
###############################################################################
# Shopware 6.7 Admin API Reference
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
# Christopher Einenkel
#
# Test-ID:
# D015
#
# Odoo-Pendant:
# odoo-v20/D015-sale-order-invoice-status.sh
#
# Plenty-Pendant:
# plenty/D015-sale-order-invoice-status.sh
#
# Beschreibung:
# Prueft den Zahlungsstatus (order_transaction.state) eines Auftrags.
#
# Migrationshinweis:
# Odoos invoice_status ist ein einzelnes berechnetes Feld am sale.order.
# Shopware trennt das strikt: order.state (Gesamtstatus),
# order_transaction.state (Zahlung/vergleichbar mit invoice_status) und
# order_delivery.state (Versand) sind DREI unabhaengige State-Maschinen auf
# drei verschiedenen Entities - keine Zusammenfassung in einem Feld.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${SALE_ORDER_ID:?Export SALE_ORDER_ID=<Auftrags-UUID>}"
curl -sS -X POST "${SHOPWARE_URL%/}/api/search/order-transaction" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d "{\"filter\":[{\"type\":\"equals\",\"field\":\"orderId\",\"value\":\"${SALE_ORDER_ID}\"}],\"associations\":{\"stateMachineState\":{}}}"

