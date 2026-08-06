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
# A021
#
# Odoo-Pendant:
# odoo/A021-fields_get_attributes.sh
#
# Plenty-Pendant:
# plenty/A021-fields_get_attributes.sh
#
# Beschreibung:
# Liest ausgewaehlte Attribute der Feldmetadaten aus dem live abrufbaren
# Schema.
#
# Migrationshinweis:
# Siehe A007 - dieselbe Einschraenkung: kein gezieltes fields_get(), nur
# Filtern des kompletten Schemas per jq.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${SHOPWARE_URL%/}/api/_info/openapi3.json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" | jq '.components.schemas.Customer.required'

