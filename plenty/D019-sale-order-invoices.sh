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
# Test-ID:
# D019
#
# Odoo-Pendant:
# odoo/D019-sale-order-invoices.sh
#
# Shopware-Pendant:
# shopware/D019-sale-order-invoices.sh
#
# Beschreibung:
# Erzeugt/liest das Rechnungsdokument eines Auftrags.
#
# Migrationshinweis:
# Odoo: invoice_ids verweist auf echte account.move-Datensaetze (buchhalterisch
# relevant). Plenty generiert ein PDF-Dokument ohne eigenen Buchungssatz -
# siehe G-Serie fuer die weitreichenderen Folgen dieses Unterschieds.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${SALE_ORDER_ID:?Export SALE_ORDER_ID=<Auftrags-ID>}"
curl -sS -X POST "${PLENTY_URL%/}/rest/orders/${SALE_ORDER_ID}/documents/invoice/generate" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

