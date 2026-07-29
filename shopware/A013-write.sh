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
# A013
#
# Odoo-Pendant:
# odoo/A013-write.sh
#
# Plenty-Pendant:
# plenty/A013-write.sh
#
# Beschreibung:
# Aktualisiert die E-Mail-Adresse eines bestehenden Kunden.
#
# Migrationshinweis:
# PATCH ist ein echtes Partial-Update (nur die uebergebenen Felder aendern
# sich) - naeher an Odoos write() als Plentys sehr eingeschraenktes Contact-
# PUT-Schema (dort nur title/options moeglich).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${CUSTOMER_ID:?Export CUSTOMER_ID=<Kunden-UUID>}"
curl -sS -X PATCH "${SHOPWARE_URL%/}/api/customer/${CUSTOMER_ID}" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d '{"email":"json2-test-updated@example.com"}'

