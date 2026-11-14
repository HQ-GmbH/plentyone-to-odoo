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
# A002
#
# Odoo-Pendant:
# odoo-v20/A002-auth-invalid.sh
#
# Shopware-Pendant:
# shopware/A002-auth-invalid.sh
#
# Beschreibung:
# Ruft Kontakte mit einem ungueltigen Bearer-Token ab (erwartet Fehler).
###############################################################################

source ../config.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/accounts/contacts" -H "Authorization: Bearer INVALID"

