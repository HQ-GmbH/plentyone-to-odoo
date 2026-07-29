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
# Test-ID:
# A017
#
# Odoo-Pendant:
# odoo/A017-invalid-field.sh
#
# Beschreibung:
# Sendet eine unbekannte Eigenschaft im Request-Body.
#
# Migrationshinweis:
# UNVERIFIZIERT, empirisch zu pruefen: ob Shopwares DAL unbekannte JSON-Felder
# beim Schreiben hart ablehnt (aehnlich Odoos strikter ORM-Validierung) oder
# stillschweigend ignoriert (vermutet aehnlich Plenty). Da Shopwares DAL-
# Schema-Validierung generell strenger wirkt als das, was bei Plenty beobachtet
# werden konnte, ist ein harter Fehler hier plausibler - aber nicht belegt.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X POST "${SHOPWARE_URL%/}/api/customer" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d '{"thisFieldDoesNotExist":"x"}'

