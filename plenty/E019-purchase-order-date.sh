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
# E019
#
# Odoo-Pendant:
# odoo/E019-purchase-order-date.sh
#
# Shopware-Pendant:
# shopware/E019-purchase-order-date.sh
#
# Beschreibung:
# Filtert Nachbestellungen nach Erstellungsdatum.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${DATE_FROM:?Export DATE_FROM=<Datum, z.B. 2026-01-01>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/orders?orderType=12&createdAtFrom=${DATE_FROM}&itemsPerPage=50" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

