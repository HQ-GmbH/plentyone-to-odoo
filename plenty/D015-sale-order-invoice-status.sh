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
# D015
#
# Odoo-Pendant:
# odoo/D015-sale-order-invoice-status.sh
#
# Shopware-Pendant:
# shopware/D015-sale-order-invoice-status.sh
#
# Beschreibung:
# Prueft, ob fuer einen Auftrag bereits eine Rechnung erzeugt wurde.
#
# Migrationshinweis:
# Odoo: invoice_status ist ein berechnetes Auswahlfeld (to
# invoice/invoiced/no/upselling) DIREKT am Auftrag. Plenty: Rechnungen sind
# generierte DOKUMENTE (PDF), kein Buchhaltungsdatensatz - der 'Status' ergibt
# sich nur daraus, ob unter diesem Pfad bereits ein Dokument existiert, nicht
# aus einem Statusfeld.
# KORREKTUR: /rest/orders/{orderId}/documents/{type} kennt laut Spec nur
# POST (Dokument generieren). Fuer die reine Statusabfrage (GET, ohne neu zu
# generieren) ist /rest/orders/{orderId}/documents/{type}/current der
# richtige Pfad.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${SALE_ORDER_ID:?Export SALE_ORDER_ID=<Auftrags-ID>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/orders/${SALE_ORDER_ID}/documents/invoice/current" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

