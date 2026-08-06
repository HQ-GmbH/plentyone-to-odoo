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
# E004
#
# Odoo-Pendant:
# odoo/E004-purchase-order-write.sh
#
# Shopware-Pendant:
# shopware/E004-purchase-order-write.sh
#
# Beschreibung:
# Aktualisiert die Lieferantenzuordnung einer Nachbestellung.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${PURCHASE_ORDER_ID:?Export PURCHASE_ORDER_ID=<Auftrags-ID>}"
: "${VENDOR_ID:?Export VENDOR_ID=<Contact-ID des Lieferanten>}"
curl -sS -X PUT "${PLENTY_URL%/}/rest/orders/${PURCHASE_ORDER_ID}" -H "Content-Type: application/json" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" -d "{\"relations\":[{\"referenceType\":\"contact\",\"referenceId\":${VENDOR_ID},\"relation\":\"sender\"}]}"

