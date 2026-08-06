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
# A017
#
# Odoo-Pendant:
# odoo/A017-invalid-field.sh
#
# Shopware-Pendant:
# shopware/A017-invalid-field.sh
#
# Beschreibung:
# Sendet eine unbekannte Eigenschaft im Request-Body.
#
# Migrationshinweis:
# Odoo lehnt unbekannte Felder bei create()/write() typischerweise mit einem
# harten Fehler ab (strikte ORM-Feldvalidierung). Plenty ignoriert unbekannte
# JSON-Eigenschaften stillschweigend (schwaechere Validierung).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X POST "${PLENTY_URL%/}/rest/accounts/contacts" -H "Content-Type: application/json" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" -d '{"referrerId":1,"typeId":1,"thisFieldDoesNotExist":"x"}'

