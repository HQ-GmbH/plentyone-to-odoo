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
# D002
#
# Odoo-Pendant:
# odoo/D002-sale-order-create.sh
#
# Beschreibung:
# Legt einen neuen Auftrag an (komplex, in der Praxis unueblich).
#
# Migrationshinweis:
# WICHTIGE EINSCHRAENKUNG: Auftraege werden bei Shopware in der Praxis fast
# immer ueber die Store-API/den Checkout-Prozess erzeugt, NICHT direkt ueber
# die Admin-API - das Order-Schema verlangt u.a. stateId (eine
# instanzabhaengige state_machine_state-UUID, siehe D009-Hinweis) sowie
# Rundungskonfigurationsobjekte (itemRounding/totalRounding), die es bei
# Odoo/Plenty so nicht gibt. Ein per Admin-API erzeugter Auftrag hat ausserdem
# KEINE orderCustomer-/lineItems-Verknuepfung, wenn diese nicht ZUSAETZLICH
# separat angelegt werden (order-customer, order-line-item sind eigene
# Entities). Fuer ein Migrationstool: Auftragsimport nach Shopware ist deutlich
# aufwendiger als nach Plenty oder Odoo.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${CUSTOMER_ID:?Export CUSTOMER_ID=<Kunden-UUID>}"
: "${ADDRESS_ID:?Export ADDRESS_ID=<Rechnungsadress-UUID des Kunden>}"
: "${CURRENCY_ID:?Export CURRENCY_ID=<Waehrungs-UUID>}"
: "${SALES_CHANNEL_ID:?Export SALES_CHANNEL_ID=<Sales-Channel-UUID>}"
: "${LANGUAGE_ID:?Export LANGUAGE_ID=<Sprach-UUID>}"
: "${OPEN_STATE_ID:?Export OPEN_STATE_ID=<state_machine_state-UUID fuer order.state=open>}"
curl -sS -X POST "${SHOPWARE_URL%/}/api/order?_response=detail" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d "{\"billingAddressId\":\"${ADDRESS_ID}\",\"currencyId\":\"${CURRENCY_ID}\",\"languageId\":\"${LANGUAGE_ID}\",\"salesChannelId\":\"${SALES_CHANNEL_ID}\",\"orderDateTime\":\"$(date -u +%Y-%m-%dT%H:%M:%S.000+00:00)\",\"currencyFactor\":1.0,\"stateId\":\"${OPEN_STATE_ID}\",\"itemRounding\":{\"decimals\":2,\"interval\":0.01,\"roundForNet\":true},\"totalRounding\":{\"decimals\":2,\"interval\":0.01,\"roundForNet\":true}}"

