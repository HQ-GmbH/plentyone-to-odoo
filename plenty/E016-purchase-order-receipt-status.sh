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
# UNVERIFIZIERT: Laut Purchase-Orders-Guide sind gebuchte Transaktionen am Feld
# receiptId auf Positionsebene erkennbar - ein separates, aggregiertes
# receipt_status-Feld auf Auftragsebene (wie bei Odoo) konnte in der Spec nicht
# bestaetigt werden.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${PURCHASE_ORDER_ID:?Export PURCHASE_ORDER_ID=<Auftrags-ID>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/reorders/${PURCHASE_ORDER_ID}?with=orderItems" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" | jq '.orderItems[]? | {id, receiptId}'

