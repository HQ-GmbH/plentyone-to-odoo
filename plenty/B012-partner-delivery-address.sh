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
# B012
#
# Odoo-Pendant:
# odoo-v20/B012-partner-delivery-address.sh
#
# Shopware-Pendant:
# shopware/B012-partner-delivery-address.sh
#
# Beschreibung:
# Liest die Adressen eines Kontakts, gefiltert nach Adresstyp.
#
# Migrationshinweis:
# Siehe B011 - ADDRESS_TYPE_ID zuvor per GET
# /rest/accounts/addresses/relation_types ermitteln.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${CONTACT_ID:?Export CONTACT_ID=<Kontakt-ID>}"
: "${ADDRESS_TYPE_ID:?Export ADDRESS_TYPE_ID=<ID aus relation_types, z.B. Lieferadresse>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/accounts/contacts/${CONTACT_ID}/addresses/${ADDRESS_TYPE_ID}" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

