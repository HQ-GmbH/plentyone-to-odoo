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
# https://github.com/hqgmbh/plentyone-to-odoo
#
# SPDX-License-Identifier: Apache-2.0
#
# Reviewed by:
# Christopher Einenkel
#
# Test-ID:
# A006
#
# Odoo-Pendant:
# odoo/A006-read.sh
#
# Plenty-Pendant:
# plenty/A006-read.sh
#
# Beschreibung:
# Liest einen einzelnen Kunden per ID.
#
# Migrationshinweis:
# Shopware-IDs sind UUIDs (36-Zeichen-Strings), keine Integer wie bei
# Odoo/Plenty - relevant fuer jede ID-Spalte in einem Migrationstool
# (Odoo/Plenty Integer-PK <-> Shopware UUID-PK, kein direktes 1:1-Mapping
# moeglich, es braucht immer eine externe ID-Zuordnungstabelle).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${CUSTOMER_ID:?Export CUSTOMER_ID=<Kunden-UUID>}"
curl -sS -X GET "${SHOPWARE_URL%/}/api/customer/${CUSTOMER_ID}" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}"

