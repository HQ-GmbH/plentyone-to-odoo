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
# F003
#
# Odoo-Pendant:
# odoo/F003-stock-picking-fields_get.sh
#
# Shopware-Pendant:
# shopware/F003-stock-picking-fields_get.sh
#
# Beschreibung:
# Liest Feldmetadaten des Wareneingangs-Schemas (Naeherung).
###############################################################################

curl -sS "https://raw.githubusercontent.com/plentymarkets/api-doc/master/plentymarkets/openApiV3/openApiV3.json" | jq '.paths["/rest/stockmanagement/warehouses/{warehouseId}/stock/bookIncomingItems"].put.requestBody.content["application/json"].schema'

