#!/usr/bin/env bash
###############################################################################
# Odoo 19 JSON-2 API Reference
#
# Companion Repository to the reference book
# "PlentyOne → Odoo 19 Enterprise Migration"
#
# Copyright (c) 2026 HQ GmbH
# https://www.hqgmbh.de
#
# Repository
# https://github.com/hqgmbh/plenty-erp2odoo
#
# Author
# Mathias Goldhan
#
# SPDX-License-Identifier: Apache-2.0
#
# Test-ID:
# A021
#
# Beschreibung:
# Liest die Felddefinitionen inklusive Typ, Pflichtfeld und Beschreibung.
#
# Erwartetes Ergebnis:
# JSON mit Metadaten aller Felder des Modells res.partner.
#
# Plenty-Pendant:
# plenty/A021-fields_get_attributes.sh
#
# Shopware-Pendant:
# shopware/A021-fields_get_attributes.sh
#
# Reviewed by:
# Lukas Ehrenberg
###############################################################################

source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl \
-X POST \
"${ODOO_URL}/json/2/res.partner/fields_get" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${ODOO_API_KEY}" \
-d '{
  "attributes": [
    "string",
    "type",
    "required"
  ]
}'