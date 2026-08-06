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
# A030
#
# Odoo-Pendant:
# odoo/A030-benchmark-search_read.sh
#
# Plenty-Pendant:
# plenty/A030-benchmark-search_read.sh
#
# Beschreibung:
# Einfacher Benchmark der Kunden-Suche mit 100 Eintraegen.
#
# Migrationshinweis:
# Im Unterschied zu Plenty gibt es fuer die Admin API KEINE offiziell
# dokumentierten festen Rate-Limit-Werte (die 429-Fehlerkomponente existiert im
# Schema, ist aber an keinem Endpunkt tatsaechlich verknuepft) - Benchmarks
# sollten trotzdem defensiv bleiben, da undokumentiertes Verhalten nicht
# bedeutet, dass es keine Grenzen gibt.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

time curl -sS -X POST "${SHOPWARE_URL%/}/api/search/customer" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d '{"limit":100}'

