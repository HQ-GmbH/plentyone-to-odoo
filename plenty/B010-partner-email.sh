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
# B010
#
# Odoo-Pendant:
# odoo-v20/B010-partner-email.sh
#
# Shopware-Pendant:
# shopware/B010-partner-email.sh
#
# Beschreibung:
# Sucht einen Kontakt per exakter E-Mail-Adresse.
#
# Migrationshinweis:
# email = exakter Treffer, contactEmail = unscharfer Treffer (siehe A025). Odoo
# hat dafuer nur ein einziges Feld + Domain-Operator (=, ilike).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/accounts/contacts?email=json2-test@example.com" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

