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
# A009
#
# Odoo-Pendant:
# odoo/A009-pagination.sh
#
# Plenty-Pendant:
# plenty/A009-pagination.sh
#
# Beschreibung:
# Demonstriert Pagination ueber page/limit.
#
# Migrationshinweis:
# Odoo: offset+limit (0-basiert). Shopware: page+limit (1-basiert, wie Plenty).
# Umrechnung: page = floor(offset/limit) + 1.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${SHOPWARE_URL%/}/api/customer?page=2&limit=10" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}"

