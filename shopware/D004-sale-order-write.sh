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
# D004
#
# Odoo-Pendant:
# odoo/D004-sale-order-write.sh
#
# Beschreibung:
# Aktualisiert den internen Kommentar eines Auftrags.
#
# Migrationshinweis:
# internalComment (nur intern sichtbar) ist der naeheste Treffer fuer ein
# freies Referenz-/Notizfeld wie Odoos client_order_ref - es gibt zusaetzlich
# customerComment (vom Kunden im Checkout eingegeben).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${SALE_ORDER_ID:?Export SALE_ORDER_ID=<Auftrags-UUID>}"
curl -sS -X PATCH "${SHOPWARE_URL%/}/api/order/${SALE_ORDER_ID}" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d '{"internalComment":"JSON-2 test update"}'

