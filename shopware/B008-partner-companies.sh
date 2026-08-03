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
# B008
#
# Odoo-Pendant:
# odoo/B008-partner-companies.sh
#
# Plenty-Pendant:
# plenty/B008-partner-companies.sh
#
# Beschreibung:
# Listet Firmenkunden (accountType=business, UNVERIFIZIERT).
#
# Migrationshinweis:
# UNVERIFIZIERT: das Schema beschreibt accountType nur als "personal or
# business" ohne explizites Enum - die exakten String-Werte (vermutlich
# "private"/"business") vor Nutzung gegen eine echte Instanz verifizieren.
# Alternative, sicher belegte Filterung: "company" ist nicht null/leer.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X POST "${SHOPWARE_URL%/}/api/search/customer" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d '{"filter":[{"type":"equals","field":"accountType","value":"business"}],"limit":50}'

