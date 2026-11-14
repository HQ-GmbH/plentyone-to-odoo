#!/usr/bin/env bash
###############################################################################
# Plenty REST API Reference
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
# Lukas Ehrenberg
#
# Test-ID:
# C019
#
# Odoo-Pendant:
# odoo-v20/C019-product-pagination.sh
#
# Shopware-Pendant:
# shopware/C019-product-pagination.sh
#
# Beschreibung:
# Demonstriert Pagination bei Variationen.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${LIMIT:=20}"; : "${OFFSET_PAGE:=2}"
curl -sS -X GET "${PLENTY_URL%/}/rest/items/variations?page=${OFFSET_PAGE}&itemsPerPage=${LIMIT}" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

