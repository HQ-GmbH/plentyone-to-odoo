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
# G016
#
# Odoo-Pendant:
# odoo/G016-account-bank-journals.sh
#
# Shopware-Pendant:
# shopware/G016-account-bank-journals.sh
#
# Beschreibung:
# Naeherung: listet konfigurierte Zahlungsarten (Payment Methods).
#
# Migrationshinweis:
# Kein Bank-Journal, aber Zahlungsarten (mopId-Stammdaten, z.B.
# Ueberweisung/PayPal/Kreditkarte) sind der naechstliegende Bezug zu 'wie
# fliesst Geld'. Kein Kontostand, keine Buchungshistorie je Zahlungsart.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

# Hinweis: liefert laut Spec ein blankes Array (kein Paginierungs-Envelope),
# deklarierte Query-Parameter sind nur backendActive und backendSearchable.
curl -sS -X GET "${PLENTY_URL%/}/rest/payments/methods" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

