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
# G001
#
# Odoo-Pendant:
# odoo/G001-account-move-search.sh
#
# Shopware-Pendant:
# shopware/G001-account-move-search.sh
#
# Beschreibung:
# Naeherung: listet Zahlungstransaktionen (kein Journal-Aequivalent vorhanden).
#
# Migrationshinweis:
# ZENTRALER BEFUND fuer die G-Serie: Die Plenty REST-API (1199 Pfade
# durchsucht) enthaelt KEIN Aequivalent zu Odoos account.move/account.journal
# (kein Hauptbuch, keine Soll/Haben-Buchungssaetze). Am naechsten kommen
# /rest/payments (Zahlungstransaktionen) sowie generierte PDF-Dokumente. Fuer
# die Migration bedeutet das: Buchhaltung wird bei Plenty typischerweise an ein
# EXTERNES System (DATEV o.ae.) exportiert (siehe
# /rest/accounting/locations/... Mapping-Konfiguration, G017) - es gibt kein
# 1:1 zu importierendes Odoo-Modell auf Plenty-Seite.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/payments/search?itemsPerPage=20" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

