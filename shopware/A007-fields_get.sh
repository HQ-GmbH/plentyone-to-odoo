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
# A007
#
# Odoo-Pendant:
# odoo-v20/A007-fields_get.sh
#
# Plenty-Pendant:
# plenty/A007-fields_get.sh
#
# Beschreibung:
# Liest Feldmetadaten des Customer-Modells aus dem live abrufbaren OpenAPI-
# Schema der Instanz.
#
# Migrationshinweis:
# Deutlicher POSITIVER Unterschied zu Plenty: Shopware liefert das
# vollstaendige OpenAPI-Schema LIVE von der eigenen Instanz (inkl.
# individueller Plugin-Erweiterungen/CustomFields), waehrend Plenty nur ein
# statisches, generisches GitHub-Dokument bietet. Trotzdem KEIN echtes
# fields_get() - der Endpunkt liefert das ganze Schema, keine gezielte Abfrage
# pro Modell/Feld; das Filtern (hier per jq) bleibt Client-Aufgabe. Erfordert
# ausserdem (anders als bei Plenty) einen gueltigen Bearer-Token.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${SHOPWARE_URL%/}/api/_info/openapi3.json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" | jq '.components.schemas.Customer'

