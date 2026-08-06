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
# G002
#
# Odoo-Pendant:
# odoo/G002-account-move-read.sh
#
# Shopware-Pendant:
# shopware/G002-account-move-read.sh
#
# Beschreibung:
# Liest eine einzelne Zahlungstransaktion.
#
# Migrationshinweis:
# Payment ist keine Buchung (kein Konto, kein Soll/Haben), sondern ein
# Zahlungsereignis (amount/currency/type/status/mopId). Siehe G001.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${PAYMENT_ID:?Export PAYMENT_ID=<Payment-ID>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/payments/${PAYMENT_ID}" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

