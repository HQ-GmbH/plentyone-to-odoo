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
# D017
#
# Odoo-Pendant:
# odoo/D017-sale-order-company.sh
#
# Plenty-Pendant:
# plenty/D017-sale-order-company.sh
#
# Beschreibung:
# Listet Auftraege eines bestimmten Sales Channel (Shop/Kanal).
#
# Migrationshinweis:
# salesChannelId trennt nach Vertriebskanal (z.B. Onlineshop A vs. B2B-Shop B),
# nicht nach rechtlicher Firma wie Odoos company_id - konzeptionell aehnlich zu
# Plentys plentyId (siehe MIGRATION_NOTES.md, Abschnitt 5), aber wieder eine
# dritte, eigene Auspraegung dieser Idee.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${SALES_CHANNEL_ID:?Export SALES_CHANNEL_ID=<Sales-Channel-UUID>}"
curl -sS -X POST "${SHOPWARE_URL%/}/api/search/order" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d "{\"filter\":[{\"type\":\"equals\",\"field\":\"salesChannelId\",\"value\":\"${SALES_CHANNEL_ID}\"}],\"limit\":50}"

