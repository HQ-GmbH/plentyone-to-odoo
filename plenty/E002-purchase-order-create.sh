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
# E002
#
# Odoo-Pendant:
# odoo/E002-purchase-order-create.sh
#
# Shopware-Pendant:
# shopware/E002-purchase-order-create.sh
#
# Beschreibung:
# Legt eine neue Nachbestellung bei einem Lieferanten an.
#
# Migrationshinweis:
# Reorders werden ueber den generischen /rest/orders-Endpunkt mit typeId=12
# angelegt (kein dediziertes Reorder-Modell wie bei Odoos purchase.order). Das
# OpenAPI-Schema dokumentiert zusaetzlich einen eigenen Endpunkt /rest/reorders
# - dieser war gegen eine echte Instanz jedoch nicht erreichbar. Der
# Lieferant wird per relation='sender' verknuepft (er SENDET die Ware),
# waehrend beim Verkaufsauftrag der Kunde als 'receiver' verknuepft wird
# (siehe D002).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${VENDOR_ID:?Export VENDOR_ID=<Contact-ID des Lieferanten>}"
curl -sS -X POST "${PLENTY_URL%/}/rest/orders" -H "Content-Type: application/json" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" -d "{\"typeId\":12,\"relations\":[{\"referenceType\":\"contact\",\"referenceId\":${VENDOR_ID},\"relation\":\"sender\"}]}"

