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
# F013
#
# Odoo-Pendant:
# odoo/F013-stock-move-available.sh
#
# Plenty-Pendant:
# plenty/F013-stock-move-available.sh
#
# Beschreibung:
# Liest den verfuegbaren (reservierungsbereinigten) Bestand eines Produkts.
#
# Migrationshinweis:
# availableStock ist ein READ-ONLY, systemseitig berechnetes Feld (stock minus
# Menge in offenen Bestellungen) - der einzige echte Treffer der F-Serie im
# Core, vergleichbar mit Odoos virtual_available/Plentys netStock, allerdings
# ohne Lageraufschluesselung (nur ein globaler Wert, kein Wert je Warehouse).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${PRODUCT_ID:?Export PRODUCT_ID=<Produkt-UUID>}"
curl -sS -X GET "${SHOPWARE_URL%/}/api/product/${PRODUCT_ID}" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" | jq '{id, stock, availableStock}'

