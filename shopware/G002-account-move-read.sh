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
# G002
#
# Odoo-Pendant:
# odoo/G002-account-move-read.sh
#
# Beschreibung:
# Liest eine einzelne Zahlungstransaktion.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${ORDER_TRANSACTION_ID:?Export ORDER_TRANSACTION_ID=<Transaktions-UUID>}"
curl -sS -X GET "${SHOPWARE_URL%/}/api/order-transaction/${ORDER_TRANSACTION_ID}" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}"

