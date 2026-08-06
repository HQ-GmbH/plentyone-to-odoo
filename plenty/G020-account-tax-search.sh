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
# /rest/vat entspricht weitgehend Odoos account.tax, ist aber anders geschnitten:
# ein Vat-Datensatz ist eine Steuer-KONFIGURATION je Land/Standort (countryId,
# locationId, isStandard, marginScheme, taxIdNumber, Gueltigkeitszeitraum ueber
# startedAt/invalidFrom) und fasst VIER Steuersaetze zusammen, waehrend bei Odoo
# ein account.tax genau EINEN Satz traegt. Belegt ist das an der Beschreibung von
# Vat.id ("A VAT configuration includes 4 VAT rates") und an marginScheme, dessen
# erlaubte Werte 'vat1' bis 'vat4' lauten. Die Saetze selbst liefert der Endpunkt
# mit; strukturiert sind sie nach dem Schema VatRate (id, name, vatRate,
# revenueAccount).
#
# Spec-Fallstrick: die Vat-Schemadefinition listet die Satz-Felder NICHT auf, und
# der with-Parameter kennt nur 'location' und 'country'. Wer sich allein auf das
# Schema verlaesst, haelt die Saetze fuer nicht abrufbar - die Antwort enthaelt
# mehr, als dort dokumentiert ist.
#
# Fuer die Migration relevant: Odoos account.tax vereint Satz UND Kontenzuordnung
# in einem Datensatz. VatRate.revenueAccount ist die naechstliegende Entsprechung
# zu Odoos Steuerkonto-Verknuepfung; die 4:1-Aufteilung muss beim Mapping
# aufgeloest werden.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/vat?itemsPerPage=50" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

