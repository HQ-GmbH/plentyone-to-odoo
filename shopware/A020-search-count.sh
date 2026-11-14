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
# A020
#
# Odoo-Pendant:
# odoo-v20/A020-search-count.sh
#
# Plenty-Pendant:
# plenty/A020-search-count.sh
#
# Beschreibung:
# Ermittelt die Gesamtanzahl aller Kunden.
#
# Migrationshinweis:
# Kein dedizierter search_count()-Endpunkt, aber "total-count-mode":"exact"
# liefert eine verlaessliche Gesamtzahl im Envelope ("total") - ohne dieses
# Flag liefert Shopware aus Performancegruenden per Default nur eine
# ungefaehre/keine Zahl ("none").
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X POST "${SHOPWARE_URL%/}/api/search/customer" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d '{"limit":1,"total-count-mode":"exact"}' | jq '.total'

