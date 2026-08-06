#!/usr/bin/env bash
###############################################################################
# Shopware 6.7 Admin API Reference
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
# Christopher Einenkel
#
# Test-ID:
# A018
#
# Odoo-Pendant:
# odoo/A018-empty-result.sh
#
# Plenty-Pendant:
# plenty/A018-empty-result.sh
#
# Beschreibung:
# Filtert auf eine garantiert nicht existierende Kunden-ID.
#
# Migrationshinweis:
# Anders als Odoo/Plenty (Integer-IDs, z.B. 99999999) muss der Test-
# Nichttreffer-Wert hier ein syntaktisch gueltiger, aber nicht vergebener UUID-
# String sein (32 Hex-Zeichen ohne Bindestriche im Shopware-internen Format).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X POST "${SHOPWARE_URL%/}/api/search/customer" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d '{"filter":[{"type":"equals","field":"id","value":"00000000000000000000000000000000"}]}'

