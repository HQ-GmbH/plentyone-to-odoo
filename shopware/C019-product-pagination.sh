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
# C019
#
# Odoo-Pendant:
# odoo/C019-product-pagination.sh
#
# Plenty-Pendant:
# plenty/C019-product-pagination.sh
#
# Beschreibung:
# Demonstriert Pagination bei Produkten.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${LIMIT:=20}"; : "${OFFSET_PAGE:=2}"
curl -sS -X GET "${SHOPWARE_URL%/}/api/product?page=${OFFSET_PAGE}&limit=${LIMIT}" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}"

