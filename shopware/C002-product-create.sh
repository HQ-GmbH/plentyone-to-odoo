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
# C002
#
# Odoo-Pendant:
# odoo/C002-product-create.sh
#
# Plenty-Pendant:
# plenty/C002-product-create.sh
#
# Beschreibung:
# Legt ein neues Testprodukt an.
#
# Migrationshinweis:
# Odoo: list_price ist ein einzelner Skalar. Shopware: price ist ein ARRAY von
# Preisobjekten (ein Eintrag je Waehrung) mit GLEICHZEITIG gespeichertem
# Brutto- UND Nettowert ("gross"/"net") - kein einzelner Preis mit implizit
# abgeleitetem Steuersatz wie bei Odoo. "linked":false bedeutet, dass gross/net
# unabhaengig voneinander gepflegt werden (kein automatisches Nachrechnen).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${TAX_ID:?Export TAX_ID=<Steuersatz-UUID>}"
: "${CURRENCY_ID:?Export CURRENCY_ID=<Waehrungs-UUID>}"
TEST_SKU="${TEST_SKU:-C002-$(date +%s)}"
curl -sS -X POST "${SHOPWARE_URL%/}/api/product?_response=detail" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d "{\"name\":\"JSON-2 API test product\",\"productNumber\":\"${TEST_SKU}\",\"stock\":100,\"taxId\":\"${TAX_ID}\",\"price\":[{\"currencyId\":\"${CURRENCY_ID}\",\"gross\":19.99,\"net\":16.80,\"linked\":false}]}"

