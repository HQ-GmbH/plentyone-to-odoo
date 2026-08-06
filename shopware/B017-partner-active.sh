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
# B017
#
# Odoo-Pendant:
# odoo/B017-partner-active.sh
#
# Plenty-Pendant:
# plenty/B017-partner-active.sh
#
# Beschreibung:
# Deaktiviert einen Kunden.
#
# Migrationshinweis:
# Anders als bei Plenty (kein active-Feld am Contact) existiert bei Shopware
# ein echtes active-Flag am Customer - naeher an Odoos active-Konzept.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${CUSTOMER_ID:?Export CUSTOMER_ID=<Kunden-UUID>}"
curl -sS -X PATCH "${SHOPWARE_URL%/}/api/customer/${CUSTOMER_ID}" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d '{"active":false}'

