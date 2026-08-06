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
# B011
#
# Odoo-Pendant:
# odoo/B011-partner-invoice-address.sh
#
# Shopware-Pendant:
# shopware/B011-partner-invoice-address.sh
#
# Beschreibung:
# Listet Adresstypen und die Adressen eines Kontakts (Rechnungsadresse).
#
# Migrationshinweis:
# Odoo nutzt feste String-Werte (type='invoice'), Plenty konfigurierbare
# Integer-IDs - daher per relation_types abfragen, nicht hart codieren.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

# Adresstyp-IDs (z.B. Rechnung/Lieferung) sind instanzabhaengig konfigurierbar:
curl -sS -X GET "${PLENTY_URL%/}/rest/accounts/addresses/relation_types" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"
echo
: "${CONTACT_ID:?Export CONTACT_ID=<Kontakt-ID>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/accounts/contacts/${CONTACT_ID}/addresses" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

