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
# Test-ID:
# A027
#
# Odoo-Pendant:
# odoo/A027-not-in-domain.sh
#
# Beschreibung:
# Schliesst mehrere Kunden per ID-Liste aus (not+equalsAny verschachtelt).
#
# Migrationshinweis:
# Ebenfalls ein direkter Treffer (anders als bei Plenty, wo dies nur
# clientseitig moeglich ist): "not" negiert die verschachtelte
# "queries"-Bedingung serverseitig.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X POST "${SHOPWARE_URL%/}/api/search/customer" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d '{"filter":[{"type":"not","operator":"or","queries":[{"type":"equalsAny","field":"id","value":["CUSTOMER_UUID_1","CUSTOMER_UUID_2"]}]}]}'

