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
# Bucht eine Nachbestellung (spezialisierter book-Endpunkt).
#
# Migrationshinweis:
# Anders als beim generischen D013 (PUT statusId) bietet Plenty fuer Reorders
# einen DEDIZIERTEN book-Endpunkt mit Geschaeftslogik (vermutlich inkl.
# Lagerbuchung) - naeher an Odoos button_confirm() als ein reiner
# Statuswechsel.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${PURCHASE_ORDER_ID:?Export PURCHASE_ORDER_ID=<Auftrags-ID eines Testauftrags>}"
curl -sS -X POST "${PLENTY_URL%/}/rest/reorders/${PURCHASE_ORDER_ID}/book" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

