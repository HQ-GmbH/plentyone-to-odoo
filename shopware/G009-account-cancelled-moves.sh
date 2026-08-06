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
# G009
#
# Odoo-Pendant:
# odoo/G009-account-cancelled-moves.sh
#
# Plenty-Pendant:
# plenty/G009-account-cancelled-moves.sh
#
# Beschreibung:
# Listet stornierte Auftraege (order.state technicalName=cancelled).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X POST "${SHOPWARE_URL%/}/api/search/order" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d '{"filter":[{"type":"equals","field":"stateMachineState.technicalName","value":"cancelled"}],"associations":{"stateMachineState":{}},"limit":50}'

