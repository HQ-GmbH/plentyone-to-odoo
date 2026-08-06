#!/usr/bin/env bash
###############################################################################
# Shopware 6.7 Admin API Reference
#
# Companion Repository zum Referenzwerk
# "PlentyOne → Odoo 19 Enterprise Migration"
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
# A022
#
# Odoo-Pendant:
# odoo/A022-name_search.sh
#
# Plenty-Pendant:
# plenty/A022-name_search.sh
#
# Beschreibung:
# Fuehrt eine unscharfe Namenssuche durch (contains-Filter).
#
# Migrationshinweis:
# "contains" ist Shopwares direktes Aequivalent zu Odoos ilike - kein
# kombiniertes name_search() wie bei Odoo (Name ODER ID), muesste per multi/or
# selbst zusammengesetzt werden.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X POST "${SHOPWARE_URL%/}/api/search/customer" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d '{"filter":[{"type":"contains","field":"lastName","value":"Company"}],"limit":10}'

