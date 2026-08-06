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
# C015
#
# Odoo-Pendant:
# odoo/C015-product-uom.sh
#
# Plenty-Pendant:
# plenty/C015-product-uom.sh
#
# Beschreibung:
# Liest die Mengeneinheit und die Grundpreis-Angaben eines Produkts.
#
# Migrationshinweis:
# purchaseUnit/referenceUnit sind KEINE zweite Masseinheit, sondern numerische
# Mengenangaben fuer die Grundpreisberechnung (z.B. 'Grundpreis pro 100ml' nach
# deutscher Preisangabenverordnung) - leicht mit einer echten Einkaufs-
# Masseinheit zu verwechseln. Es gibt nur EIN unitId-Feld (referenziert die
# Unit-Entity).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${PRODUCT_ID:?Export PRODUCT_ID=<Produkt-UUID>}"
curl -sS -X GET "${SHOPWARE_URL%/}/api/product/${PRODUCT_ID}?associations[unit][]" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}"
echo
curl -sS -X GET "${SHOPWARE_URL%/}/api/product/${PRODUCT_ID}" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" | jq '{id, unitId, purchaseUnit, referenceUnit}'

