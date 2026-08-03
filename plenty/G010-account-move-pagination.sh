#!/usr/bin/env bash
###############################################################################
# Plenty REST API Reference
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
# Reviewed by:
# Lukas Ehrenberg
#
# Test-ID:
# G010
#
# Odoo-Pendant:
# odoo/G010-account-move-pagination.sh
#
# Shopware-Pendant:
# shopware/G010-account-move-pagination.sh
#
# Beschreibung:
# Demonstriert Pagination bei Zahlungstransaktionen.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/payments/search?page=2&itemsPerPage=20" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

