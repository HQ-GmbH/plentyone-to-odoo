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
# B014
#
# Odoo-Pendant:
# odoo/B014-partner-country-language.sh
#
# Beschreibung:
# Zeigt Sprache (Customer) und Land (Adresse) eines Kunden.
#
# Migrationshinweis:
# Wie bei Plenty: languageId liegt am Customer, countryId an der Adresse - zwei
# Quellen statt eines einzelnen Felderpaars wie bei Odoo.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${CUSTOMER_ID:?Export CUSTOMER_ID=<Kunden-UUID>}"
curl -sS -X POST "${SHOPWARE_URL%/}/api/search/customer" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d "{\"filter\":[{\"type\":\"equals\",\"field\":\"id\",\"value\":\"${CUSTOMER_ID}\"}],\"associations\":{\"defaultBillingAddress\":{}}}" | jq '.data[0] | {languageId: .languageId, countryId: .defaultBillingAddress.countryId}'

