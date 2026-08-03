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
# B011
#
# Odoo-Pendant:
# odoo/B011-partner-invoice-address.sh
#
# Plenty-Pendant:
# plenty/B011-partner-invoice-address.sh
#
# Beschreibung:
# Liest die Rechnungsadresse eines Kunden.
#
# Migrationshinweis:
# Anders als bei Odoo (type='invoice' auf einem generischen Adress-Datensatz)
# und Plenty (konfigurierbare numerische Adresstyp-ID) referenziert Shopware
# die Rechnungsadresse direkt per Feld defaultBillingAddressId am Customer
# selbst - die Adresse trägt keinen eigenen 'Typ'.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${CUSTOMER_ID:?Export CUSTOMER_ID=<Kunden-UUID>}"
curl -sS -X POST "${SHOPWARE_URL%/}/api/search/customer" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d "{\"filter\":[{\"type\":\"equals\",\"field\":\"id\",\"value\":\"${CUSTOMER_ID}\"}],\"associations\":{\"defaultBillingAddress\":{}}}"

