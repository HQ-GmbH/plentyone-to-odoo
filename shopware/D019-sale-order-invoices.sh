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
# D019
#
# Odoo-Pendant:
# odoo/D019-sale-order-invoices.sh
#
# Plenty-Pendant:
# plenty/D019-sale-order-invoices.sh
#
# Beschreibung:
# Erzeugt das Rechnungsdokument (PDF) eines Auftrags.
#
# Migrationshinweis:
# Wie bei Plenty (POST .../documents/invoice/generate) erzeugt Shopware nur ein
# PDF-DOKUMENT (document-Entity mit Verweis auf eine media-Datei) ohne eigenen
# Buchungssatz dahinter - keines der drei APIs bildet Odoos account.move nach.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${SALE_ORDER_ID:?Export SALE_ORDER_ID=<Auftrags-UUID>}"
curl -sS -X POST "${SHOPWARE_URL%/}/api/_action/order/document/invoice/create" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d "{\"orderId\":\"${SALE_ORDER_ID}\",\"config\":{}}"

