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
# D007
#
# Odoo-Pendant:
# odoo/D007-sale-order-customer.sh
#
# Shopware-Pendant:
# shopware/D007-sale-order-customer.sh
#
# Beschreibung:
# Listet Verkaufsauftraege eines bestimmten Kunden.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${CUSTOMER_ID:?Export CUSTOMER_ID=<Contact-ID des Kunden>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/orders?orderType=1&contactId=${CUSTOMER_ID}&itemsPerPage=50" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

