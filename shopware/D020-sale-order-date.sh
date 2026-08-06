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
# D020
#
# Odoo-Pendant:
# odoo/D020-sale-order-date.sh
#
# Plenty-Pendant:
# plenty/D020-sale-order-date.sh
#
# Beschreibung:
# Filtert Auftraege nach Erstellungsdatum.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${DATE_FROM:?Export DATE_FROM=<ISO-8601-Datum, z.B. 2026-01-01T00:00:00.000+00:00>}"
curl -sS -X POST "${SHOPWARE_URL%/}/api/search/order" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d "{\"filter\":[{\"type\":\"range\",\"field\":\"orderDateTime\",\"parameters\":{\"gte\":\"${DATE_FROM}\"}}],\"limit\":50}"

