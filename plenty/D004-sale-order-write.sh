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
# D004
#
# Odoo-Pendant:
# odoo/D004-sale-order-write.sh
#
# Beschreibung:
# Weist einem Auftrag einen anderen Bearbeiter (ownerId) zu.
#
# Migrationshinweis:
# Das Order-PUT-Schema erlaubt laut Spec nur wenige Top-Level-Felder
# (addressRelations, lockStatus, orderItems, ownerId, plentyId, properties,
# relations, statusId, typeId) - deutlich weniger als Odoos sale.order.write()
# mit fast beliebigen Feldern. Ein freies Referenzfeld wie Odoos
# client_order_ref existiert nicht direkt; am ehesten ueber das generische
# properties[]-Array (instanzabhaengig konfigurierbare Zusatzfelder)
# nachbildbar.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${SALE_ORDER_ID:?Export SALE_ORDER_ID=<Auftrags-ID>}"
: "${OWNER_ID:?Export OWNER_ID=<Backend-Benutzer-ID>}"
curl -sS -X PUT "${PLENTY_URL%/}/rest/orders/${SALE_ORDER_ID}" -H "Content-Type: application/json" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" -d "{\"ownerId\":${OWNER_ID}}"

