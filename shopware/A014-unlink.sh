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
# Lukas Ehrenberg
#
# Test-ID:
# A014
#
# Odoo-Pendant:
# odoo/A014-unlink.sh
#
# Plenty-Pendant:
# plenty/A014-unlink.sh
#
# Beschreibung:
# Loescht einen Testkunden.
#
# Migrationshinweis:
# Liefert im Erfolgsfall 204 No Content (kein Body) - im Unterschied zu
# Odoo/Plenty, die i.d.R. ein JSON-Ergebnis liefern.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${CUSTOMER_ID:?Export CUSTOMER_ID=<Kunden-UUID>}"
curl -sS -X DELETE "${SHOPWARE_URL%/}/api/customer/${CUSTOMER_ID}" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}"

