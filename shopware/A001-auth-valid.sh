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
# A001
#
# Odoo-Pendant:
# odoo/A001-auth-valid.sh
#
# Beschreibung:
# Fuehrt einen gueltigen OAuth2-Login durch und ruft anschliessend Kunden ab.
#
# Migrationshinweis:
# Odoo nutzt einen statischen API-Key. Shopware nutzt echtes OAuth2
# (grant_type=client_credentials gegen eine Integration, siehe _login.sh). Der
# Token ist mit 600s (10 Minuten) SEHR kurzlebig - deutlich kuerzer als Plentys
# 24h. Fuer ein Migrationstool bedeutet das: Token muss praktisch vor JEDEM
# laengeren Batch neu geholt werden, nicht nur gelegentlich aufgefrischt.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${SHOPWARE_URL%/}/api/customer?limit=1" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}"

