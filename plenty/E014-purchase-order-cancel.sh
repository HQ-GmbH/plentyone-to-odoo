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
# E014
#
# Odoo-Pendant:
# odoo/E014-purchase-order-cancel.sh
#
# Shopware-Pendant:
# shopware/E014-purchase-order-cancel.sh
#
# Beschreibung:
# Stornoiert eine Nachbestellung.
#
# Migrationshinweis:
# Kein dedizierter cancel-Endpunkt fuer Reorders dokumentiert; der generische
# /rest/orders/{orderId}/cancel-Endpunkt greift auch fuer Reorders
# (typuebergreifend dokumentiert).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${PURCHASE_ORDER_ID:?Export PURCHASE_ORDER_ID=<Auftrags-ID eines Testauftrags>}"
curl -sS -X PUT "${PLENTY_URL%/}/rest/orders/${PURCHASE_ORDER_ID}/cancel" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

