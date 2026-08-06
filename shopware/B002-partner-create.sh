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
# https://github.com/hqgmbh/plentyone-to-odoo
#
# SPDX-License-Identifier: Apache-2.0
#
# Reviewed by:
# Christopher Einenkel
#
# Test-ID:
# B002
#
# Odoo-Pendant:
# odoo/B002-partner-create.sh
#
# Plenty-Pendant:
# plenty/B002-partner-create.sh
#
# Beschreibung:
# Legt einen neuen Firmenkunden inkl. Adresse in EINEM verschachtelten Request
# an.
#
# Migrationshinweis:
# Siehe A011 - der zentrale Unterschied zu Plenty (dort zwingend zwei getrennte
# Calls fuer Contact+Address). "company" wird sowohl am Customer selbst als
# auch an der Adresse gesetzt, da beide unabhaengig voneinander existieren
# (z.B. fuer abweichende Rechnungs- vs. Lieferanschrift bei Firmenkunden).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${CUSTOMER_GROUP_ID:?Export CUSTOMER_GROUP_ID=<Kundengruppen-UUID>}"
: "${SALES_CHANNEL_ID:?Export SALES_CHANNEL_ID=<Sales-Channel-UUID>}"
: "${LANGUAGE_ID:?Export LANGUAGE_ID=<Sprach-UUID>}"
: "${COUNTRY_ID:?Export COUNTRY_ID=<Land-UUID>}"
ADDRESS_UUID=$(uuidgen | tr "[:upper:]" "[:lower:]" | tr -d "-")
curl -sS -X POST "${SHOPWARE_URL%/}/api/customer?_response=detail" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d "{\"email\":\"json2-company@example.com\",\"firstName\":\"JSON2\",\"lastName\":\"Testpartner\",\"company\":\"JSON2 Testpartner GmbH\",\"customerNumber\":\"C-JSON2-$(date +%s)\",\"groupId\":\"${CUSTOMER_GROUP_ID}\",\"salesChannelId\":\"${SALES_CHANNEL_ID}\",\"languageId\":\"${LANGUAGE_ID}\",\"addresses\":[{\"id\":\"${ADDRESS_UUID}\",\"firstName\":\"JSON2\",\"lastName\":\"Testpartner\",\"company\":\"JSON2 Testpartner GmbH\",\"street\":\"Teststrasse 1\",\"city\":\"Musterstadt\",\"zipcode\":\"12345\",\"countryId\":\"${COUNTRY_ID}\"}],\"defaultBillingAddressId\":\"${ADDRESS_UUID}\",\"defaultShippingAddressId\":\"${ADDRESS_UUID}\"}"

