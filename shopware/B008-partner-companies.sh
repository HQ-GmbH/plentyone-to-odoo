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
# B008
#
# Odoo-Pendant:
# odoo/B008-partner-companies.sh
#
# Plenty-Pendant:
# plenty/B008-partner-companies.sh
#
# Beschreibung:
# Listet Firmenkunden (accountType=business).
#
# Migrationshinweis:
# accountType kennt die beiden Werte "business" und "private" (siehe B009).
# Achtung bei der Schema-Lektuere: die Feldbeschreibung im OpenAPI-Schema
# formuliert das unpraeziser als "personal or business" und hinterlegt kein
# Enum - der tatsaechliche Wert fuer Privatkunden ist "private", nicht
# "personal". Als alternative Filterung ist auch "company ist nicht
# null/leer" moeglich.
#
# Odoo unterscheidet Firma/Person ueber das Boolean is_company, Plenty ueber
# einen numerischen typeId - Shopware ueber diesen String. Drei verschiedene
# Modellierungen desselben Unterschieds.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X POST "${SHOPWARE_URL%/}/api/search/customer" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d '{"filter":[{"type":"equals","field":"accountType","value":"business"}],"limit":50}'

