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
# A019
#
# Odoo-Pendant:
# odoo-v20/A019-complex-domain.sh
#
# Shopware-Pendant:
# shopware/A019-complex-domain.sh
#
# Beschreibung:
# Kombiniert zwei Filter (Kundentyp + Land).
#
# Migrationshinweis:
# Odoos domain-Liste erlaubt beliebig verschachtelte UND/ODER-Bedingungen
# ([('a','=',1),'|',('b','=',2),('c','=',3)]). Plenty-Filter sind flache Query-
# Parameter (implizites UND); komplexe ODER-Logik ist bei
# /rest/accounts/contacts nicht moeglich (bei /rest/orders/search existiert
# dagegen ein JSON-Body mit conditionType/fields/groups fuer komplexere
# Bedingungen).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/accounts/contacts?typeId=1&countryId=1" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

