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
# D013
#
# Odoo-Pendant:
# odoo/D013-sale-order-confirm.sh
#
# Shopware-Pendant:
# shopware/D013-sale-order-confirm.sh
#
# Beschreibung:
# Setzt den Auftragsstatus auf 'Warenausgang gebucht' (naechste Entsprechung zu
# action_confirm).
#
# Migrationshinweis:
# Odoos action_confirm() ist eine dedizierte Business-Methode mit
# Seiteneffekten (Lagerreservierung, Nummernkreis etc.). Ein einfaches PUT
# statusId=7 loest bei Plenty den Statuswechsel aus; die spezialisierten
# Endpunkte (POST /rest/sales_orders/{orderId}/book) sind dafuer nicht
# erforderlich.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${SALE_ORDER_ID:?Export SALE_ORDER_ID=<Auftrags-ID eines Testauftrags>}"
curl -sS -X PUT "${PLENTY_URL%/}/rest/orders/${SALE_ORDER_ID}" -H "Content-Type: application/json" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" -d '{"statusId":7}'

