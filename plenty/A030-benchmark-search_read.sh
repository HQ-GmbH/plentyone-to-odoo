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
# A030
#
# Odoo-Pendant:
# odoo/A030-benchmark-search_read.sh
#
# Beschreibung:
# Einfacher Benchmark der Kontakt-Liste mit 100 Eintraegen.
#
# Migrationshinweis:
# Beachte beim Vergleich mit Odoo-Benchmarks: Die Plenty-Rate-Limits (z.B.
# 80-280 Lesezugriffe/User/Minute je Tarif) begrenzen den maximal sinnvollen
# Parallelisierungsgrad eines Migrationstools zusaetzlich zur reinen
# Antwortzeit.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

time curl -sS -X GET "${PLENTY_URL%/}/rest/accounts/contacts?itemsPerPage=100" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

