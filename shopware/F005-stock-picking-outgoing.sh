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
# F005
#
# Odoo-Pendant:
# odoo/F005-stock-picking-outgoing.sh
#
# Beschreibung:
# Verringert den Lagerbestand eines Produkts (absolutes Setzen).
#
# Migrationshinweis:
# Bei einem abgeschlossenen Checkout verringert Shopware den Bestand
# AUTOMATISCH selbst (systemgesteuert) - ein manuelles PATCH ist nur fuer
# Korrekturen/Wareneingaenge ausserhalb des Checkout-Flows nötig, siehe auch
# F004.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${PRODUCT_ID:?Export PRODUCT_ID=<Produkt-UUID>}"
: "${NEW_STOCK:?Export NEW_STOCK=<neuer absoluter Lagerbestand>}"
curl -sS -X PATCH "${SHOPWARE_URL%/}/api/product/${PRODUCT_ID}" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d "{\"stock\":${NEW_STOCK}}"

