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
# E013
#
# Odoo-Pendant:
# odoo/E013-purchase-order-confirm.sh
#
# Shopware-Pendant:
# shopware/E013-purchase-order-confirm.sh
#
# Beschreibung:
# Bucht eine Nachbestellung (Statuswechsel, analog D013).
#
# Migrationshinweis:
# UNVERIFIZIERT: Das OpenAPI-Schema dokumentiert einen dedizierten
# book-Endpunkt (POST /rest/reorders/{id}/book) mit vermutlicher
# Geschaeftslogik (Lagerbuchung) - naeher an Odoos button_confirm() als ein
# reiner Statuswechsel. Dieser Endpunkt war gegen eine echte Instanz jedoch
# nicht erreichbar. Wie bei D013 bleibt offen, ob ein einfaches PUT statusId
# auf /rest/orders/{id} dieselben Seiteneffekte ausloest - vor produktivem
# Einsatz empirisch gegen eine Testinstanz verifizieren.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${PURCHASE_ORDER_ID:?Export PURCHASE_ORDER_ID=<Auftrags-ID eines Testauftrags>}"
curl -sS -X PUT "${PLENTY_URL%/}/rest/orders/${PURCHASE_ORDER_ID}" -H "Content-Type: application/json" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" -d '{"statusId":7}'

