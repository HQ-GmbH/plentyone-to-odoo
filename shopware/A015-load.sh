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
# A015
#
# Odoo-Pendant:
# odoo/A015-load.sh
#
# Plenty-Pendant:
# plenty/A015-load.sh
#
# Beschreibung:
# Importiert mehrere Kunden per Bulk-Sync-Action.
#
# Migrationshinweis:
# Direkter, echter Bulk-Endpunkt (_action/sync mit action=upsert), der sowohl
# NEUE Datensaetze anlegen als auch bestehende aktualisieren kann (echtes
# upsert!) - das kommt Odoos load() naeher als Plentys batch_update (nur
# Updates, kein Bulk-Create). payload hier bewusst leer gelassen (Platzhalter);
# echte Objekte wie im create-Payload aus A011 einsetzen.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X POST "${SHOPWARE_URL%/}/api/_action/sync" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -H "fail-on-error: true" -d '[{"action":"upsert","entity":"customer","payload":[]}]'

