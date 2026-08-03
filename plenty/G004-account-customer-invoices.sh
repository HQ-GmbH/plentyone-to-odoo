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
# G004
#
# Odoo-Pendant:
# odoo/G004-account-customer-invoices.sh
#
# Shopware-Pendant:
# shopware/G004-account-customer-invoices.sh
#
# Beschreibung:
# Erzeugt das Rechnungsdokument (PDF) eines Verkaufsauftrags.
#
# Migrationshinweis:
# Odoos account.move (move_type=out_invoice) ist ein eigener buchhalterischer
# Datensatz mit Buchungszeile, Faelligkeit, Zahlungsstatus etc. Plenty erzeugt
# nur ein PDF-DOKUMENT ohne Buchungssatz dahinter - siehe G001.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${SALE_ORDER_ID:?Export SALE_ORDER_ID=<Auftrags-ID>}"
curl -sS -X POST "${PLENTY_URL%/}/rest/orders/${SALE_ORDER_ID}/documents/invoice/generate" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

