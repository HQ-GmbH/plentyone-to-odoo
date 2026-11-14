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
# F009
#
# Odoo-Pendant:
# odoo-v20/F009-stock-picking-cancel.sh
#
# Shopware-Pendant:
# shopware/F009-stock-picking-cancel.sh
#
# Beschreibung:
# Kein Storno gebuchter Bewegungen - Korrektur per Gegenbuchung.
#
# Migrationshinweis:
# Odoos stock.picking.action_cancel() macht eine noch nicht abgeschlossene
# Reservierung rueckgaengig, OHNE dass je eine Bestandsbewegung stattfand. Bei
# Plenty gibt es diese Vorstufe nicht (siehe F007) - 'etwas rueckgaengig
# machen' bedeutet bei bereits gebuchtem Bestand immer eine zusaetzliche
# Korrekturbuchung (reasonId=106 'Maculation canceled'), nie ein echtes
# Loeschen der urspruenglichen Buchung.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${WAREHOUSE_ID:?Export WAREHOUSE_ID=<Lager-ID>}"
: "${VARIATION_ID:?Export VARIATION_ID=<Variations-ID>}"
# Keine "cancel"-Operation auf bereits gebuchte Bewegungen. Stattdessen wird
# der Bestand per Korrekturbuchung ausgeglichen:
curl -sS -X PUT "${PLENTY_URL%/}/rest/stockmanagement/warehouses/${WAREHOUSE_ID}/stock/correction" -H "Content-Type: application/json" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" -d "{\"variationId\":${VARIATION_ID},\"quantity\":0,\"reasonId\":106}"

