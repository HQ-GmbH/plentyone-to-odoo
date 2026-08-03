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
# G020
#
# Odoo-Pendant:
# odoo/G020-account-tax-search.sh
#
# Shopware-Pendant:
# shopware/G020-account-tax-search.sh
#
# Beschreibung:
# Listet die konfigurierten Steuersaetze (VAT).
#
# Migrationshinweis:
# ACHTUNG, kein 1:1-Treffer: /rest/vat liefert die Steuer-KONFIGURATION je
# Land/Standort (countryId, locationId, isStandard, marginScheme, taxIdNumber,
# Gueltigkeitszeitraum ueber startedAt/invalidFrom) - der Vat-Datensatz selbst
# enthaelt KEINEN Steuersatz-Wert. Die eigentlichen Saetze stecken im separaten
# Schema VatRate (id, name, vatRate, revenueAccount). Der with-Parameter von
# /rest/vat laedt laut Spec nur 'location' oder 'country', NICHT die VatRates -
# die Zuordnung Konfiguration -> Saetze ist ueber diesen Endpunkt also nicht
# direkt abrufbar.
#
# Fuer die Migration relevant: Odoos account.tax vereint Satz UND Kontenzuordnung
# in einem Datensatz. Plenty trennt Konfiguration (Vat) von Satz (VatRate);
# VatRate.revenueAccount ist dabei die naechstliegende Entsprechung zu Odoos
# Steuerkonto-Verknuepfung.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/vat?itemsPerPage=50" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

