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
# https://github.com/hqgmbh/plentyone-to-odoo
#
# SPDX-License-Identifier: Apache-2.0
#
# Reviewed by:
# Lukas Ehrenberg
#
# Test-ID:
# D012
#
# Odoo-Pendant:
# odoo/D012-sale-order-lines.sh
#
# Shopware-Pendant:
# shopware/D012-sale-order-lines.sh
#
# Beschreibung:
# Listet die Positionen eines Verkaufsauftrags.
#
# Migrationshinweis:
# Odoo: sale.order.line ist ein EIGENES Modell mit eigenem Endpunkt. Plenty:
# orderItems sind ein eingebettetes Array direkt im Order-Objekt, kein separat
# adressierbarer REST-Endpunkt fuer Positionslisten losgeloest vom Auftrag.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${SALE_ORDER_ID:?Export SALE_ORDER_ID=<Auftrags-ID>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/orders/${SALE_ORDER_ID}?with=orderItems" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" | jq '.orderItems'

