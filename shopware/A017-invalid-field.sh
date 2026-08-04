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
# https://github.com/hqgmbh/plenty-erp2odoo
#
# SPDX-License-Identifier: Apache-2.0
#
# Reviewed by:
# Christopher Einenkel
#
# Test-ID:
# A017
#
# Odoo-Pendant:
# odoo/A017-invalid-field.sh
#
# Plenty-Pendant:
# plenty/A017-invalid-field.sh
#
# Beschreibung:
# Sendet eine unbekannte Eigenschaft im Request-Body.
#
# Migrationshinweis:
# Odoo lehnt unbekannte Felder bei create()/write() hart ab (strikte
# ORM-Feldvalidierung). Shopwares DAL validiert den Request gegen die
# Entity-Definition und ist damit ebenfalls strikt - anders als Plenty, das
# unbekannte JSON-Eigenschaften stillschweigend ignoriert (siehe
# plenty/A017-invalid-field.sh). Fuer ein Migrationstool heisst das: Tippfehler
# in Feldnamen fallen bei Odoo und Shopware auf, bei Plenty nicht.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X POST "${SHOPWARE_URL%/}/api/customer" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d '{"thisFieldDoesNotExist":"x"}'

