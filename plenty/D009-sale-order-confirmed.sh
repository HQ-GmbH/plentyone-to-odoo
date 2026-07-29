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
# D009
#
# Odoo-Pendant:
# odoo/D009-sale-order-confirmed.sh
#
# Beschreibung:
# Listet bestaetigte/in Bearbeitung befindliche Verkaufsauftraege ueber einen
# Statusbereich.
#
# Migrationshinweis:
# GROSSER KONZEPTUNTERSCHIED: Odoo kennt genau 5 sale.order-States
# (draft/sent/sale/done/cancel). Plenty nutzt ein DEZIMALES Statussystem mit
# bis zu 199.999 frei konfigurierbaren Werten (z.B. 3=Warten auf Zahlung,
# 3.2/3.3/3.4=Unterzustaende, 7=Warenausgang gebucht, 8=Storniert).
# statusFrom/statusTo filtert einen NUMERISCHEN Bereich, was bei Dezimal-
# Substatus (z.B. 3.2) andere Ergebnisse liefern kann als erwartet. Fuer das
# Migrationstool: eine feste State-Mapping-Tabelle Odoo<->Plenty ist zwingend
# erforderlich und muss je Kundeninstanz verifiziert werden (Status sind
# konfigurierbar!).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/orders?orderType=1&statusFrom=3&statusTo=7&itemsPerPage=50" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

