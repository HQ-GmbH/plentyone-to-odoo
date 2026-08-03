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
# A007
#
# Odoo-Pendant:
# odoo/A007-fields_get.sh
#
# Shopware-Pendant:
# shopware/A007-fields_get.sh
#
# Beschreibung:
# Liest Feldmetadaten des Contact-Modells (Naeherung).
#
# Migrationshinweis:
# Plenty bietet KEINE Laufzeit-Introspektion pro Instanz wie fields_get(). Die
# einzige verfuegbare Feldmetadaten-Quelle ist das statisch publizierte
# OpenAPI-Schema (github.com/plentymarkets/api-doc), nicht die Instanz selbst.
# Fuer ein Migrationstool: Feldkatalog muss aus der Doku/Spec generiert werden,
# nicht zur Laufzeit abgefragt.
###############################################################################

curl -sS "https://raw.githubusercontent.com/plentymarkets/api-doc/master/plentymarkets/openApiV3/openApiV3.json" | jq '.components.schemas.Contact'

