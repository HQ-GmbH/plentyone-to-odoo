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
# https://github.com/hqgmbh/plentyone-to-odoo
#
# SPDX-License-Identifier: Apache-2.0
#
# Reviewed by:
# Christopher Einenkel
#
# Test-ID:
# G001
#
# Odoo-Pendant:
# odoo/G001-account-move-search.sh
#
# Plenty-Pendant:
# plenty/G001-account-move-search.sh
#
# Beschreibung:
# Naeherung: listet Zahlungstransaktionen (order-transaction) - kein Journal-
# Aequivalent vorhanden.
#
# Migrationshinweis:
# ZENTRALER BEFUND (systematisch gegen alle 419 Schema-Namen geprueft): kein
# Treffer fuer account/journal/booking/ledger. order-transaction ist ein
# Zahlungs-VORGANG (verknuepft mit einer Zahlungsmethode und einem Status),
# kein Buchungssatz mit Soll/Haben-Konten. Shopware hat damit SOGAR WENIGER
# Buchhaltungsnaehe als Plenty (das immerhin eine dedizierte /rest/payments-
# Ressource UND eine Buchhaltungs-Export-Konfiguration fuer DATEV o.ae. hat) -
# bei Shopware fehlt selbst diese Export-Mapping-Konfiguration im Core
# komplett, das wird ueblicherweise durch Drittanbieter-Plugins nachgeruestet.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${SHOPWARE_URL%/}/api/order-transaction?limit=20" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}"

