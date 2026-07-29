#!/usr/bin/env bash
###############################################################################
# Plenty REST API Reference
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
# Shopware-Pendant:
# shopware/D001-sale-order-search.sh
#
# Beschreibung:
# Listet Verkaufsauftraege (orderType=1).
#
# Migrationshinweis:
# Plenty modelliert sale.order UND purchase.order als denselben Order-Datentyp,
# unterschieden nur durch typeId/orderType (1=Sales order,
# 12=Reorder='Einkauf', 15=Redistribution='Umlagerung', plus 15 weitere Typen
# wie Delivery/Return/CreditNote/Offer/Warranty/...). Odoo dagegen nutzt zwei
# komplett getrennte Modelle (sale.order/purchase.order) mit eigenen
# States/Feldern.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/orders?orderType=1&itemsPerPage=20" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

