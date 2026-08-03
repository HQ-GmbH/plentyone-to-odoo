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
# Reviewed by:
# Lukas Ehrenberg
#
# Test-ID:
# D006
#
# Odoo-Pendant:
# odoo/D006-sale-order-fields_get.sh
#
# Plenty-Pendant:
# plenty/D006-sale-order-fields_get.sh
#
# Beschreibung:
# Liest Feldmetadaten des Order-Modells aus dem live abrufbaren Schema.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${SHOPWARE_URL%/}/api/_info/openapi3.json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" | jq '.components.schemas.Order.required'

