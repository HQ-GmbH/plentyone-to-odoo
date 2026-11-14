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
# E002
#
# Odoo-Pendant:
# odoo-v20/E002-purchase-order-create.sh
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
#
# Wichtig beim Wechsel von /rest/reorders auf /rest/orders: die Pflichtfelder
# unterscheiden sich. /rest/reorders verlangte nur 'relations', /rest/orders
# verlangt 'plentyId' UND 'typeId'. plentyId (Mandant/Webshop) hat bei Odoo
# keine direkte Entsprechung - am naechsten liegt company_id, trennt aber nach
# rechtlicher Einheit statt nach Vertriebskanal.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${VENDOR_ID:?Export VENDOR_ID=<Contact-ID des Lieferanten>}"
: "${PLENTY_STORE_ID:?Export PLENTY_STORE_ID=<plentyId des Webshops/Mandanten>}"
curl -sS -X POST "${PLENTY_URL%/}/rest/orders" -H "Content-Type: application/json" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" -d "{\"plentyId\":${PLENTY_STORE_ID},\"typeId\":12,\"relations\":[{\"referenceType\":\"contact\",\"referenceId\":${VENDOR_ID},\"relation\":\"sender\"}]}"

