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
# F019
#
# Odoo-Pendant:
# odoo/F019-stock-picking-types.sh
#
# Shopware-Pendant:
# shopware/F019-stock-picking-types.sh
#
# Beschreibung:
# Gruppiert Lager nach Lagertyp (naeherungsweise 'Operationstypen').
#
# Migrationshinweis:
# KONZEPTUNTERSCHIED: Odoos stock.picking.type definiert OPERATIONEN
# (eingehend/ausgehend/intern) INNERHALB eines Warehouse. Plenty's
# Warehouse.typeId (0=Sales, 1=Repair, 4=Storage, 5=Transit, 6=Distribution,
# 7=Other) beschreibt stattdessen den ZWECK des Lagers SELBST, nicht eine
# Operation darauf. Es ist keine echte Entsprechung, nur die naechstliegende
# Klassifikation.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

# Hinweis: /rest/stockmanagement/warehouses ist nicht paginiert (Spec: nur 'with').
# Die Antwort ist als generische 'Collection' deklariert, ohne dokumentiertes
# entries-Feld - daher '(.entries // .)', damit sowohl ein Paginierungs-Envelope
# als auch ein blankes Array verarbeitet wird.
curl -sS -X GET "${PLENTY_URL%/}/rest/stockmanagement/warehouses" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" | jq '(.entries // .) | group_by(.typeId) | map({typeId: .[0].typeId, count: length})'

