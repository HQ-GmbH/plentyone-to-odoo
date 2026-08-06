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
# https://github.com/hqgmbh/plentyone-to-odoo
#
# SPDX-License-Identifier: Apache-2.0
#
# Reviewed by:
# Christopher Einenkel
#
# Test-ID:
# D008
#
# Odoo-Pendant:
# odoo/D008-sale-order-quotation.sh
#
# Plenty-Pendant:
# plenty/D008-sale-order-quotation.sh
#
# Beschreibung:
# Listet Auftraege im Anfangsstatus (order.state technicalName=open).
#
# Migrationshinweis:
# Odoo hat GENAU 5 feste sale.order-States als einfache String-Enums. Shopware
# nutzt DREI GETRENNTE State-Maschinen
# (order/order_transaction/order_delivery), deren konkrete Zustaende als
# Datensaetze in der state_machine_state-Tabelle liegen - stateId ist eine PRO
# INSTANZ UNTERSCHIEDLICHE UUID, kein fester Enum-Wert wie bei Odoo oder eine
# feste Zahl wie bei Plenty. Praktikabler als hartcodierte UUIDs: nach
# Assoziation filtern, siehe D009.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${OPEN_STATE_ID:?Export OPEN_STATE_ID=<state_machine_state-UUID fuer order.state=open>}"
curl -sS -X POST "${SHOPWARE_URL%/}/api/search/order" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d "{\"filter\":[{\"type\":\"equals\",\"field\":\"stateId\",\"value\":\"${OPEN_STATE_ID}\"}],\"limit\":50}"

