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
# G011
#
# Odoo-Pendant:
# odoo/G011-account-move-search-count.sh
#
# Shopware-Pendant:
# shopware/G011-account-move-search-count.sh
#
# Beschreibung:
# Ermittelt die Gesamtanzahl aller Zahlungstransaktionen.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/payments/search?itemsPerPage=1" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" | jq '.totalsCount'

