#!/usr/bin/env bash
###############################################################################
# Plenty REST API Reference
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
# Lukas Ehrenberg
#
# Test-ID:
# C007
#
# Odoo-Pendant:
# odoo-v20/C007-product-default-code.sh
#
# Shopware-Pendant:
# shopware/C007-product-default-code.sh
#
# Beschreibung:
# Sucht eine Variation per exakter Artikelnummer (SKU).
#
# Migrationshinweis:
# numberExact = exakter Treffer, numberFuzzy = unscharfer Treffer - analog zu
# email/contactEmail bei Contacts (siehe B010/A025).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${DEFAULT_CODE:?Export DEFAULT_CODE=<Artikelnummer>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/items/variations?numberExact=${DEFAULT_CODE}" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

