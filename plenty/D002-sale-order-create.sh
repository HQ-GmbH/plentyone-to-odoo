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
# D002
#
# Odoo-Pendant:
# odoo/D002-sale-order-create.sh
#
# Shopware-Pendant:
# shopware/D002-sale-order-create.sh
#
# Beschreibung:
# Legt einen neuen Verkaufsauftrag fuer einen Kunden an.
#
# Migrationshinweis:
# plentyId (Pflichtfeld) hat kein direktes Odoo-Aequivalent: es identifiziert,
# zu welchem Webshop/Mandanten der Auftrag gehoert - aehnlich, aber nicht
# identisch zu Odoos company_id (Odoo trennt nach rechtlicher Einheit, Plenty
# nach Vertriebskanal/Shop). Der Kunde wird nicht per partner_id-Feld, sondern
# per relations[]-Array mit relation='receiver' verknuepft.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${CUSTOMER_ID:?Export CUSTOMER_ID=<Contact-ID des Kunden>}"
: "${PLENTY_STORE_ID:?Export PLENTY_STORE_ID=<plentyId des Webshops/Mandanten>}"
curl -sS -X POST "${PLENTY_URL%/}/rest/orders" -H "Content-Type: application/json" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}" -d "{\"plentyId\":${PLENTY_STORE_ID},\"typeId\":1,\"relations\":[{\"referenceType\":\"contact\",\"referenceId\":${CUSTOMER_ID},\"relation\":\"receiver\"}]}"

