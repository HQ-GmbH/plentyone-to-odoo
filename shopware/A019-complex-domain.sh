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
# A019
#
# Odoo-Pendant:
# odoo-v20/A019-complex-domain.sh
#
# Plenty-Pendant:
# plenty/A019-complex-domain.sh
#
# Beschreibung:
# Kombiniert zwei Filter per UND-Verknuepfung (multi/and).
#
# Migrationshinweis:
# Im Unterschied zu Plenty (keine echte ODER/UND-Verschachtelung bei Contacts)
# unterstuetzt Shopware ueber "multi" (operator=and/or/nand/nor) echte,
# beliebig tief verschachtelbare Boolesche Filterlogik - strukturell sehr nah
# an Odoos Domain-Listen mit '|'/'&'.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X POST "${SHOPWARE_URL%/}/api/search/customer" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d '{"filter":[{"type":"multi","operator":"and","queries":[{"type":"equals","field":"active","value":true},{"type":"equals","field":"guest","value":false}]}]}'

