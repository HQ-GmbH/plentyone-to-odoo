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
# F004
#
# Odoo-Pendant:
# odoo/F004-stock-picking-incoming.sh
#
# Beschreibung:
# Erhoeht den Lagerbestand eines Produkts (absolutes Setzen, kein
# inkrementelles Buchen).
#
# Migrationshinweis:
# WICHTIGER technischer Unterschied zu Odoo/Plenty (dort inkrementelle
# Buchungen "+5 Stueck eingebucht"): Shopware Core kennt nur ein PATCH des
# absoluten stock-Zahlenwerts. Wer den aktuellen Bestand vor dem Schreiben
# nicht frisch gelesen hat, riskiert bei parallelen Aenderungen (z.B.
# gleichzeitige Bestellung eines Kunden) einen Lost-Update-Bug - es gibt keine
# serverseitige atomare 'inkrementiere um X'-Operation im Core.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${PRODUCT_ID:?Export PRODUCT_ID=<Produkt-UUID>}"
: "${NEW_STOCK:?Export NEW_STOCK=<neuer absoluter Lagerbestand>}"
curl -sS -X PATCH "${SHOPWARE_URL%/}/api/product/${PRODUCT_ID}" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d "{\"stock\":${NEW_STOCK}}"

