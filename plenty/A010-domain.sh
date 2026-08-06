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
# https://github.com/hqgmbh/plentyone-to-odoo
#
# SPDX-License-Identifier: Apache-2.0
#
# Reviewed by:
# Lukas Ehrenberg
#
# Test-ID:
# A010
#
# Odoo-Pendant:
# odoo/A010-domain.sh
#
# Shopware-Pendant:
# shopware/A010-domain.sh
#
# Beschreibung:
# Filtert Kontakte vom Typ Kunde (typeId=1).
#
# Migrationshinweis:
# Odoos customer_rank>0 (Integer-Rang) entspricht in Plenty dem festen typeId=1
# (Customer). Es gibt keinen Rang, nur eine feste Typ-Klassifikation
# (1=Customer, 2=Interested party, 3=Sales representative, 4=Supplier,
# 5=Manufacturer, 6=Partner).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/accounts/contacts?typeId=1" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

