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
# A023
#
# Odoo-Pendant:
# odoo/A023-read_group.sh
#
# Plenty-Pendant:
# plenty/A023-read_group.sh
#
# Beschreibung:
# Gruppiert Kunden nach Status und zaehlt sie (echte Aggregation).
#
# Migrationshinweis:
# GROSSER POSITIVER Unterschied zu Plenty (dort volles GAP): Shopware hat mit
# /api/aggregate/{entity} eine echte, serverseitige Aggregations-API
# (terms=group-by, plus count/sum/avg/min/max/stats als Metriken) - der
# naeheste Treffer der gesamten Odoo/Plenty/Shopware-Recherche zu read_group().
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X POST "${SHOPWARE_URL%/}/api/aggregate/customer" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d '{"aggregations":[{"name":"by_active","type":"terms","field":"active"}]}'

