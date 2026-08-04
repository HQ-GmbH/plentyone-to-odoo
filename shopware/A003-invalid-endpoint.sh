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
# A003
#
# Odoo-Pendant:
# odoo/A003-invalid-endpoint.sh
#
# Plenty-Pendant:
# plenty/A003-invalid-endpoint.sh
#
# Beschreibung:
# Ruft einen nicht existierenden Kunden-Pfad ab (erwartet 404 im JSON:API-
# Fehlerformat).
#
# Migrationshinweis:
# Shopware liefert Fehler im JSON:API-Format
# ({"errors":[{"status":"404","title":"Not Found",...}]}) - strukturierter als
# Odoos Fehlermeldungen und (im Unterschied zu Plenty) tatsaechlich im Schema
# dokumentiert.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${SHOPWARE_URL%/}/api/customer/not-existing-id" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}"

