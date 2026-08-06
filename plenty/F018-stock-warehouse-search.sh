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
# F018
#
# Odoo-Pendant:
# odoo/F018-stock-warehouse-search.sh
#
# Shopware-Pendant:
# shopware/F018-stock-warehouse-search.sh
#
# Beschreibung:
# Listet alle Lager.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

# Hinweis: dieser Endpunkt deklariert laut Spec nur 'with' als Query-Parameter -
# keine Paginierung (kein page/itemsPerPage), anders als das alte /rest/warehouses.
curl -sS -X GET "${PLENTY_URL%/}/rest/stockmanagement/warehouses" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

