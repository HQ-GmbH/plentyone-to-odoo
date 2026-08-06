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
# B009
#
# Odoo-Pendant:
# odoo/B009-partner-individuals.sh
#
# Plenty-Pendant:
# plenty/B009-partner-individuals.sh
#
# Beschreibung:
# Listet Privatkunden (Kehrseite von B008, accountType=private).
#
# Migrationshinweis:
# Siehe B008 zu den accountType-Werten - insbesondere dazu, dass der Wert
# "private" heisst und nicht "personal", wie die Schema-Beschreibung nahelegt.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X POST "${SHOPWARE_URL%/}/api/search/customer" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d '{"filter":[{"type":"equals","field":"accountType","value":"private"}],"limit":50}'

