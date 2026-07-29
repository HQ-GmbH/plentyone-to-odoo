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
# Test-ID:
# A021
#
# Odoo-Pendant:
# odoo/A021-fields_get_attributes.sh
#
# Beschreibung:
# Liest ausgewaehlte Attribute der Feldmetadaten (Naeherung).
#
# Migrationshinweis:
# Siehe A007 - dieselbe Einschraenkung: Plenty hat keine Laufzeit-
# Introspektion, nur das statische OpenAPI-Schema.
###############################################################################

curl -sS "https://raw.githubusercontent.com/plentymarkets/api-doc/master/plentymarkets/openApiV3/openApiV3.json" | jq '.components.schemas.Contact.properties | to_entries | map({name: .key, type: .value.type})'

