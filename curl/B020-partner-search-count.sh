#!/usr/bin/env bash
###############################################################################
# Odoo 19 JSON-2 API Reference
#
# Companion Repository zum Referenzwerk
# "PlentyOne → Odoo 19 Enterprise Migration"
#
# Copyright (c) 2026 HQ GmbH
# https://www.hqgmbh.de
#
# Repository:
# https://github.com/hqgmbh/plenty-erp2odoo
#
# SPDX-License-Identifier: Apache-2.0
#
# Test-ID:
# B020
#
# Beschreibung:
# Ermittelt die Gesamtanzahl aller Partner.
#
# Erwartetes Ergebnis:
# Integer mit der Anzahl der res.partner-Datensätze.
###############################################################################

source ../config.sh
# Voraussetzungen: ../config.sh setzt ODOO_URL und ODOO_API_KEY.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -X POST \
"${ODOO_URL}/json/2/res.partner/search_count" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ${ODOO_API_KEY}" \
-d '{
  "domain": []
}'
