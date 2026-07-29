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
# D001
#
# Odoo-Pendant:
# odoo/D001-sale-order-search.sh
#
# Beschreibung:
# Listet Bestellungen.
#
# Migrationshinweis:
# Shopwares order-Entity bildet AUSSCHLIESSLICH Verkaufsvorgaenge (Checkout) ab
# - es gibt kein Gegenstueck fuer Einkaufsauftraege (siehe E-Serie). Anders als
# bei Plenty (ein Order-Typ fuer alles, unterschieden per typeId) gibt es bei
# Shopware konzeptionell nur GENAU einen Auftragstyp.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${SHOPWARE_URL%/}/api/order?limit=20" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}"

