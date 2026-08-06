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
# D011
#
# Odoo-Pendant:
# odoo/D011-sale-order-total.sh
#
# Shopware-Pendant:
# shopware/D011-sale-order-total.sh
#
# Beschreibung:
# Berechnet die Auftragssumme clientseitig aus den Positionen.
#
# Migrationshinweis:
# Odoo speichert amount_untaxed/amount_tax/amount_total als eigene,
# vorberechnete Felder direkt am sale.order. Das Order-Schema von Plenty
# enthaelt laut Spec KEIN vergleichbares Summenfeld auf Auftragsebene - die
# Summe muss aus den orderItems (quantity * price je Position) clientseitig
# berechnet werden. Fuer Reporting/Migration bedeutet das einen zusaetzlichen
# Berechnungsschritt.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${SALE_ORDER_ID:?Export SALE_ORDER_ID=<Auftrags-ID>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/orders/${SALE_ORDER_ID}?with=orderItems" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" | jq '{orderId: .id, total: ([.orderItems[]? | (.quantity * .price // 0)] | add)}'

