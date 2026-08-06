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
# E007
#
# Odoo-Pendant:
# odoo/E007-purchase-order-vendor.sh
#
# Shopware-Pendant:
# shopware/E007-purchase-order-vendor.sh
#
# Beschreibung:
# Listet Nachbestellungen eines bestimmten Lieferanten.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${VENDOR_ID:?Export VENDOR_ID=<Contact-ID des Lieferanten>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/orders?orderType=12&contactId=${VENDOR_ID}&itemsPerPage=50" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

