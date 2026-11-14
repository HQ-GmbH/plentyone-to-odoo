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
# A010
#
# Odoo-Pendant:
# odoo-v20/A010-domain.sh
#
# Plenty-Pendant:
# plenty/A010-domain.sh
#
# Beschreibung:
# Filtert Kunden ueber einen Criteria-EqualsFilter (active=true).
#
# Migrationshinweis:
# Shopwares Criteria-Filter (type=equals/range/contains/equalsAny/multi/not)
# sind strukturell das naeheste Aequivalent zu Odoos Domain-Tupeln der ganzen
# Recherche - deutlich maechtiger als Plentys flache Query-Parameter (siehe
# A019 fuer echte UND/ODER-Verschachtelung).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X POST "${SHOPWARE_URL%/}/api/search/customer" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d '{"filter":[{"type":"equals","field":"active","value":true}]}'

