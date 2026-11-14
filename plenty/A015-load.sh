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
# A015
#
# Odoo-Pendant:
# odoo-v20/A015-load.sh
#
# Shopware-Pendant:
# shopware/A015-load.sh
#
# Beschreibung:
# Aktualisiert mehrere Kontakte in einem Bulk-Aufruf.
#
# Migrationshinweis:
# Odoos load() importiert per fields[]+data[][] (Spalten/Zeilen-Matrix, wie ein
# CSV-Import). Plenty hat kein direktes Aequivalent; die naechstliegende Bulk-
# Operation ist batch_update mit vollstaendigen Objekten statt einer Matrix.
# Fuer echten Massenimport neuer Kontakte gibt es KEINEN Bulk-create-Endpunkt -
# jeder Kontakt muss einzeln per POST angelegt werden (Rate-Limits beachten,
# siehe README).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X PUT "${PLENTY_URL%/}/rest/accounts/contacts/batch_update" -H "Content-Type: application/json" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" -d '{"contacts":[{"id":1,"title":"Load Test"}]}'

