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
# B007
#
# Odoo-Pendant:
# odoo/B007-partner-fields_get.sh
#
# Shopware-Pendant:
# shopware/B007-partner-fields_get.sh
#
# Beschreibung:
# Liest Feldmetadaten des Contact-Modells (Naeherung, siehe A007).
###############################################################################

curl -sS "https://raw.githubusercontent.com/plentymarkets/api-doc/master/plentymarkets/openApiV3/openApiV3.json" | jq '.components.schemas.Contact.properties | keys'

