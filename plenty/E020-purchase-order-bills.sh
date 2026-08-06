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
# E020
#
# Odoo-Pendant:
# odoo/E020-purchase-order-bills.sh
#
# Shopware-Pendant:
# shopware/E020-purchase-order-bills.sh
#
# Beschreibung:
# Erzeugt das Rechnungsdokument einer Nachbestellung.
#
# Migrationshinweis:
# Siehe D019/G005: kein Buchungssatz, nur ein generiertes Dokument.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${PURCHASE_ORDER_ID:?Export PURCHASE_ORDER_ID=<Auftrags-ID>}"
curl -sS -X POST "${PLENTY_URL%/}/rest/orders/${PURCHASE_ORDER_ID}/documents/invoice/generate" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

