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
# E006
#
# Odoo-Pendant:
# odoo/E006-purchase-order-fields_get.sh
#
# Shopware-Pendant:
# shopware/E006-purchase-order-fields_get.sh
#
# Beschreibung:
# Liest Feldmetadaten des Order-POST-Schemas (Naeherung, typeId=12 fuer
# Reorders - siehe E001/E002).
###############################################################################

curl -sS "https://raw.githubusercontent.com/plentymarkets/api-doc/master/plentymarkets/openApiV3/openApiV3.json" | jq '.paths["/rest/orders"].post.requestBody.content["application/json"].schema'

