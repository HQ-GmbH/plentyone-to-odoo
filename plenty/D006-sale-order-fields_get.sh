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
# D006
#
# Odoo-Pendant:
# odoo-v20/D006-sale-order-fields_get.sh
#
# Shopware-Pendant:
# shopware/D006-sale-order-fields_get.sh
#
# Beschreibung:
# Liest Feldmetadaten des Order-POST-Schemas (Naeherung).
###############################################################################

curl -sS "https://raw.githubusercontent.com/plentymarkets/api-doc/master/plentymarkets/openApiV3/openApiV3.json" | jq '.paths["/rest/orders"].post.requestBody.content["application/json"].schema'

