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
# Reviewed by:
# Lukas Ehrenberg
#
# Test-ID:
# D005
#
# Odoo-Pendant:
# odoo/D005-sale-order-unlink.sh
#
# Shopware-Pendant:
# shopware/D005-sale-order-unlink.sh
#
# Beschreibung:
# Loescht einen Verkaufsauftrag.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${SALE_ORDER_ID:?Export SALE_ORDER_ID=<Auftrags-ID>}"
curl -sS -X DELETE "${PLENTY_URL%/}/rest/orders/${SALE_ORDER_ID}" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

