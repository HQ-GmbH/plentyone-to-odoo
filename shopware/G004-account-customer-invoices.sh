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
# G004
#
# Odoo-Pendant:
# odoo/G004-account-customer-invoices.sh
#
# Plenty-Pendant:
# plenty/G004-account-customer-invoices.sh
#
# Beschreibung:
# Erzeugt das Rechnungsdokument (PDF) eines Auftrags (siehe D019).
#
# Migrationshinweis:
# Siehe D019 zum Body-Format: das Schema deklariert ein Array mit orderId und
# type als Pflicht, die Instanz akzeptiert aber ein einzelnes Objekt ohne type.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${SALE_ORDER_ID:?Export SALE_ORDER_ID=<Auftrags-UUID>}"
curl -sS -X POST "${SHOPWARE_URL%/}/api/_action/order/document/invoice/create" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d "{\"orderId\":\"${SALE_ORDER_ID}\",\"fileType\":\"pdf\",\"config\":{}}"

