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
# Christopher Einenkel
#
# Test-ID:
# A008
#
# Odoo-Pendant:
# odoo/A008-order.sh
#
# Plenty-Pendant:
# plenty/A008-order.sh
#
# Beschreibung:
# Sortiert Kunden serverseitig nach Nachname (echtes sort= via Criteria).
#
# Migrationshinweis:
# Anders als bei Plenty (kein Sortierparameter fuer Contacts) unterstuetzt
# Shopwares Criteria-System serverseitiges Sortieren fuer praktisch jedes Feld
# jeder Entity - naeher an Odoos order= als Plenty.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X POST "${SHOPWARE_URL%/}/api/search/customer" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d '{"limit":10,"sort":[{"field":"lastName","order":"ASC"}]}'

