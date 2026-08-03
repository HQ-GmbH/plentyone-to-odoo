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
# E017
#
# Odoo-Pendant:
# odoo/E017-purchase-order-company.sh
#
# Shopware-Pendant:
# shopware/E017-purchase-order-company.sh
#
# Beschreibung:
# Listet Nachbestellungen eines bestimmten Webshops/Mandanten.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${PLENTY_STORE_ID:?Export PLENTY_STORE_ID=<plentyId des Webshops>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/orders/search?orderTypeId=12&plentyId=${PLENTY_STORE_ID}&itemsPerPage=50" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

