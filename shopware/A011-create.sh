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
# A011
#
# Odoo-Pendant:
# odoo/A011-create.sh
#
# Plenty-Pendant:
# plenty/A011-create.sh
#
# Beschreibung:
# Legt einen neuen Testkunden an.
#
# Migrationshinweis:
# Bemerkenswerter POSITIVER Unterschied zu Plenty: Shopware erlaubt einen
# VERSCHACHTELTEN Write (Customer + Address) in EINEM einzigen Request, weil
# der Client selbst UUIDs vergeben darf (hier per uuidgen erzeugt) und diese
# schon im selben Payload referenzieren kann - kein Zwei-Schritt-Vorgang wie
# bei Plenty (vgl. B002 in plenty/) notwendig, obwohl Shopware Adressen
# ebenfalls als eigene Entity fuehrt. Ohne "?_response=detail" liefert
# POST/PATCH standardmaessig GAR KEINEN Body zurueck.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${CUSTOMER_GROUP_ID:?Export CUSTOMER_GROUP_ID=<Kundengruppen-UUID>}"
: "${SALES_CHANNEL_ID:?Export SALES_CHANNEL_ID=<Sales-Channel-UUID>}"
: "${LANGUAGE_ID:?Export LANGUAGE_ID=<Sprach-UUID>}"
: "${COUNTRY_ID:?Export COUNTRY_ID=<Land-UUID>}"
ADDRESS_UUID=$(cat /proc/sys/kernel/random/uuid 2>/dev/null || uuidgen | tr "[:upper:]" "[:lower:]" | tr -d "-")
curl -sS -X POST "${SHOPWARE_URL%/}/api/customer?_response=detail" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d "{\"email\":\"json2-test@example.com\",\"firstName\":\"JSON2\",\"lastName\":\"Testpartner\",\"customerNumber\":\"C-JSON2-$(date +%s)\",\"groupId\":\"${CUSTOMER_GROUP_ID}\",\"salesChannelId\":\"${SALES_CHANNEL_ID}\",\"languageId\":\"${LANGUAGE_ID}\",\"addresses\":[{\"id\":\"${ADDRESS_UUID}\",\"firstName\":\"JSON2\",\"lastName\":\"Testpartner\",\"street\":\"Teststrasse 1\",\"city\":\"Musterstadt\",\"zipcode\":\"12345\",\"countryId\":\"${COUNTRY_ID}\"}],\"defaultBillingAddressId\":\"${ADDRESS_UUID}\",\"defaultShippingAddressId\":\"${ADDRESS_UUID}\"}"

