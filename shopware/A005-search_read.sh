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
# https://github.com/hqgmbh/plenty-erp2odoo
#
# SPDX-License-Identifier: Apache-2.0
#
# Test-ID:
# A005
#
# Odoo-Pendant:
# odoo/A005-search_read.sh
#
# Beschreibung:
# Listet Kunden mit gezielter Feldauswahl (Sparse Fieldset via Criteria).
#
# Migrationshinweis:
# Anders als Plenty (das IMMER das volle Objekt liefert) unterstuetzt Shopwares
# Criteria-Suche echte Sparse-Fieldsets ueber "fields" - das ist der direkteste
# Treffer der ganzen Recherche fuer Odoos search_read(fields=[...]).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X POST "${SHOPWARE_URL%/}/api/search/customer" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d '{"limit":5,"fields":["id","email","firstName","lastName"]}'

