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
# G008
#
# Odoo-Pendant:
# odoo-v20/G008-account-posted-moves.sh
#
# Shopware-Pendant:
# shopware/G008-account-posted-moves.sh
#
# Beschreibung:
# Naeherung: listet alle Zahlungstransaktionen (ohne 'posted'-Filter).
#
# Migrationshinweis:
# Das Payment-Schema hat ein numerisches status-Feld ohne dokumentiertes Enum
# fuer die konkreten Werte. Bewusst ohne Statusfilter ausgefuehrt, um keinen
# falschen Wert zu suggerieren.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/payments/search?itemsPerPage=50" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

