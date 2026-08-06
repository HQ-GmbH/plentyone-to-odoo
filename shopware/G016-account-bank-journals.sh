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
# G016
#
# Odoo-Pendant:
# odoo/G016-account-bank-journals.sh
#
# Plenty-Pendant:
# plenty/G016-account-bank-journals.sh
#
# Beschreibung:
# Naeherung: listet konfigurierte Zahlungsmethoden.
#
# Migrationshinweis:
# Kein Bankjournal, aber Zahlungsmethoden-Stammdaten (aehnlich Plentys
# /rest/payments/methods) - kein Kontostand, keine Buchungshistorie.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${SHOPWARE_URL%/}/api/payment-method?limit=50" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}"

