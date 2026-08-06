#!/usr/bin/env bash
###############################################################################
# Shopware 6.7 Admin API Reference
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
# Christopher Einenkel
#
# Test-ID:
# D007
#
# Odoo-Pendant:
# odoo/D007-sale-order-customer.sh
#
# Plenty-Pendant:
# plenty/D007-sale-order-customer.sh
#
# Beschreibung:
# Listet Auftraege eines bestimmten Kunden.
#
# Migrationshinweis:
# Der Kunde ist nicht direkt am Order-Objekt (kein customerId-Feld dort!),
# sondern ueber die separate order-customer-Assoziation verknuepft - Filterung
# erfolgt per Punkt-Notation durch die Assoziation hindurch
# (orderCustomer.customerId). Grund: Shopware speichert einen SNAPSHOT der
# Kundendaten zum Bestellzeitpunkt (orderCustomer), nicht nur eine
# Fremdschluessel-Referenz - Adress-/Namensaenderungen am Kunden AENDERN NICHT
# rueckwirkend vergangene Auftraege, anders als bei einer reinen
# Fremdschluessel-Verknuepfung.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${CUSTOMER_ID:?Export CUSTOMER_ID=<Kunden-UUID>}"
curl -sS -X POST "${SHOPWARE_URL%/}/api/search/order" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d "{\"filter\":[{\"type\":\"equals\",\"field\":\"orderCustomer.customerId\",\"value\":\"${CUSTOMER_ID}\"}],\"limit\":50}"

