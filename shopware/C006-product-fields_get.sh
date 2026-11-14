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
# C006
#
# Odoo-Pendant:
# odoo-v20/C006-product-fields_get.sh
#
# Plenty-Pendant:
# plenty/C006-product-fields_get.sh
#
# Beschreibung:
# Liest Feldmetadaten des Product-Modells aus dem live abrufbaren Schema.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${SHOPWARE_URL%/}/api/_info/openapi3.json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" | jq '.components.schemas.Product.required'

