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
# D009
#
# Odoo-Pendant:
# odoo/D009-sale-order-confirmed.sh
#
# Plenty-Pendant:
# plenty/D009-sale-order-confirmed.sh
#
# Beschreibung:
# Listet abgeschlossene Auftraege ueber den technicalName der verknuepften
# State-Maschine (praktikabler als eine hartcodierte stateId).
#
# Migrationshinweis:
# Gefiltert wird per Punkt-Pfad durch eine Assoziation
# (stateMachineState.technicalName) statt ueber eine hartcodierte stateId-UUID.
# Das ist der robuste Weg, unabhaengig von der jeweiligen Instanz nach
# 'abgeschlossen' zu filtern: technicalName ('open'/'in_progress'/'cancelled'/
# 'completed') ist stabil, die stateId-UUID dagegen pro Instanz unterschiedlich.
# Der Punkt-Pfad erfordert, dass die Assoziation im Request unter
# "associations" mitgeladen wird.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X POST "${SHOPWARE_URL%/}/api/search/order" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d '{"filter":[{"type":"equals","field":"stateMachineState.technicalName","value":"completed"}],"associations":{"stateMachineState":{}},"limit":50}'

