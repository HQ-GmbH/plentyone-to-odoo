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
# E003
#
# Odoo-Pendant:
# odoo-v20/E003-purchase-order-read.sh
#
# Shopware-Pendant:
# shopware/E003-purchase-order-read.sh
#
# Beschreibung:
# Liest eine Nachbestellung inkl. Positionen.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${PURCHASE_ORDER_ID:?Export PURCHASE_ORDER_ID=<Auftrags-ID>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/orders/${PURCHASE_ORDER_ID}?with=orderItems,relations" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

