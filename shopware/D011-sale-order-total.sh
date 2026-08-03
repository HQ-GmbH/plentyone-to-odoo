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
# D011
#
# Odoo-Pendant:
# odoo/D011-sale-order-total.sh
#
# Plenty-Pendant:
# plenty/D011-sale-order-total.sh
#
# Beschreibung:
# Liest die gespeicherten Summenfelder eines Auftrags.
#
# Migrationshinweis:
# Anders als bei Plenty (kein gespeichertes Summenfeld, muss aus orderItems
# clientseitig berechnet werden) speichert Shopware amountNet/amountTotal
# direkt am Order-Objekt - naeher an Odoos amount_untaxed/amount_total.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${SALE_ORDER_ID:?Export SALE_ORDER_ID=<Auftrags-UUID>}"
curl -sS -X GET "${SHOPWARE_URL%/}/api/order/${SALE_ORDER_ID}" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" | jq '{id, amountNet, amountTotal, shippingTotal}'

