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
# https://github.com/hqgmbh/plenty-erp2odoo
#
# SPDX-License-Identifier: Apache-2.0
#
# Test-ID:
# A003
#
# Odoo-Pendant:
# odoo/A003-invalid-endpoint.sh
#
# Shopware-Pendant:
# shopware/A003-invalid-endpoint.sh
#
# Beschreibung:
# Ruft einen nicht existierenden Kontakt-Pfad ab (erwartet 404).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/accounts/contacts/not_existing" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

