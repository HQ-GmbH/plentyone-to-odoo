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
# https://github.com/hqgmbh/plentyone-to-odoo
#
# SPDX-License-Identifier: Apache-2.0
#
# Reviewed by:
# Lukas Ehrenberg
#
# Test-ID:
# D017
#
# Odoo-Pendant:
# odoo/D017-sale-order-company.sh
#
# Shopware-Pendant:
# shopware/D017-sale-order-company.sh
#
# Beschreibung:
# Listet Auftraege eines bestimmten Webshops/Mandanten (plentyId).
#
# Migrationshinweis:
# plentyId als Filter ist naeherungsweise das Gegenstueck zu Odoos company_id-
# Filter, siehe D002 fuer den konzeptionellen Unterschied.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${PLENTY_STORE_ID:?Export PLENTY_STORE_ID=<plentyId des Webshops>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/orders/search?plentyId=${PLENTY_STORE_ID}&itemsPerPage=50" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

