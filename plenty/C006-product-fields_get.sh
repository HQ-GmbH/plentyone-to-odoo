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
# https://github.com/hqgmbh/plentyone-to-odoo
#
# SPDX-License-Identifier: Apache-2.0
#
# Reviewed by:
# Lukas Ehrenberg
#
# Test-ID:
# C006
#
# Odoo-Pendant:
# odoo/C006-product-fields_get.sh
#
# Shopware-Pendant:
# shopware/C006-product-fields_get.sh
#
# Beschreibung:
# Liest Feldmetadaten des Variation-Request-Schemas (Naeherung).
#
# Migrationshinweis:
# Wie A007: keine Laufzeit-Introspektion, nur das statische Schema. Zusaetzlich
# zu beachten: das Variation-Response-Schema (GET) enthaelt in der Praxis mehr
# Felder als das POST-Request-Schema dokumentiert (z.B. berechnete Felder) -
# Doku und Realitaet koennen abweichen.
###############################################################################

curl -sS "https://raw.githubusercontent.com/plentymarkets/api-doc/master/plentymarkets/openApiV3/openApiV3.json" | jq '.paths["/rest/items/{itemId}/variations"].post.requestBody.content["application/json"].schema.properties | keys'

