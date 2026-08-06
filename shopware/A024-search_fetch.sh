#!/usr/bin/env bash
###############################################################################
# Shopware 6.7 Admin API Reference
#
# Companion Repository zum
# "Technischen Referenzwerk: PlentyONE → Odoo 19 mit Shopware 6"
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
# A024
#
# Odoo-Pendant:
# odoo/A024-search_fetch.sh
#
# Plenty-Pendant:
# plenty/A024-search_fetch.sh
#
# Beschreibung:
# Listet Kunden inkl. Assoziationen (entspricht dem search()+read()-Verhalten
# von search_fetch()).
#
# Migrationshinweis:
# "associations" laedt verknuepfte Entities (hier: Adressen) direkt mit -
# rekursiv verschachtelbar mit eigenen Filtern/Limits je Assoziation. Kommt
# Odoos verschachtelten Prefetches naeher als Plentys flaches "with=".
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X POST "${SHOPWARE_URL%/}/api/search/customer" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d '{"limit":10,"associations":{"addresses":{}}}'

