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
# A002
#
# Odoo-Pendant:
# odoo/A002-auth-invalid.sh
#
# Plenty-Pendant:
# plenty/A002-auth-invalid.sh
#
# Beschreibung:
# Ruft Kunden mit einem ungueltigen Bearer-Token ab (erwartet Fehler).
###############################################################################

source ../config.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${SHOPWARE_URL%/}/api/customer" -H "Authorization: Bearer INVALID"

