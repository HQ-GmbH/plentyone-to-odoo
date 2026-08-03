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
# https://github.com/hqgmbh/plenty-erp2odoo
#
# SPDX-License-Identifier: Apache-2.0
#
# Reviewed by:
# Lukas Ehrenberg
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
# UNVERIFIZIERT (technisch plausibel nach dem generellen Shopware-DAL-
# Assoziationsfilter-Muster, aber nicht an einer echten Instanz gegen dieses
# spezifische Feld getestet): Filtern per Punkt-Pfad durch eine Assoziation
# (stateMachineState.technicalName) statt einer hartcodierten stateId-UUID. Das
# waere der robustere Weg, um unabhaengig von der jeweiligen Instanz nach
# 'abgeschlossen' zu filtern, da technicalName (z.B.
# 'open'/'in_progress'/'cancelled'/'completed') stabil ist, stateId dagegen
# nicht.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X POST "${SHOPWARE_URL%/}/api/search/order" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d '{"filter":[{"type":"equals","field":"stateMachineState.technicalName","value":"completed"}],"associations":{"stateMachineState":{}},"limit":50}'

