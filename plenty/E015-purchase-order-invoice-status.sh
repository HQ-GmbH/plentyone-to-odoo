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
# E015
#
# Odoo-Pendant:
# odoo-v20/E015-purchase-order-invoice-status.sh
#
# Shopware-Pendant:
# shopware/E015-purchase-order-invoice-status.sh
#
# Beschreibung:
# Prueft, ob fuer eine Nachbestellung ein Rechnungsdokument existiert.
#
# Migrationshinweis:
# Siehe D015/G005: Plenty hat kein Vendor-Bill-Konzept, nur PDF-Dokumente ohne
# Buchungssatz. Siehe D015 fuer den korrekten GET-Pfad (.../current statt
# direkt .../invoice).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${PURCHASE_ORDER_ID:?Export PURCHASE_ORDER_ID=<Auftrags-ID>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/orders/${PURCHASE_ORDER_ID}/documents/invoice/current" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

