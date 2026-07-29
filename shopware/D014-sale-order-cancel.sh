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
# D014
#
# Odoo-Pendant:
# odoo/D014-sale-order-cancel.sh
#
# Plenty-Pendant:
# plenty/D014-sale-order-cancel.sh
#
# Beschreibung:
# Stornoiert einen Auftrag.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${SALE_ORDER_ID:?Export SALE_ORDER_ID=<Auftrags-UUID eines Testauftrags>}"
curl -sS -X POST "${SHOPWARE_URL%/}/api/_action/order/${SALE_ORDER_ID}/state/cancel" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}"

