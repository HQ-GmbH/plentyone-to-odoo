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
###############################################################################

source ../config/config.sh

curl -X POST "${ODOO_URL}/json/2/test.invalid/search_read" -H "Content-Type: application/json" -H "Authorization: Bearer ${ODOO_API_KEY}" -d '{}'
