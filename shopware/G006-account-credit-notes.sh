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
# Christopher Einenkel
#
# Test-ID:
# G006
#
# Odoo-Pendant:
# odoo/G006-account-credit-notes.sh
#
# Plenty-Pendant:
# plenty/G006-account-credit-notes.sh
#
# Beschreibung:
# Erzeugt ein Gutschrift-Dokument (PDF) zu einem Auftrag.
#
# Migrationshinweis:
# documentType "credit_note" existiert als generierbares PDF-Dokument (wie bei
# Plenty ueber typeId=4 als Auftragstyp modelliert) - auch hier wieder nur ein
# Dokument, kein Buchungssatz.
#
# Zum Body-Format: der Endpunkt erwartet ein ARRAY von Auftraegen, nicht ein
# einzelnes Objekt - er ist auf Massenerzeugung ausgelegt. Pflichtfelder je
# Eintrag sind orderId UND type; type wiederholt dabei den documentTypeName aus
# dem Pfad. Optional sind fileType (Default pdf), static, referencedDocumentId
# und config (documentNumber, documentDate etc.).
#
# Hinweis zu den Daten: eine Gutschrift setzt voraus, dass der Auftrag
# Gutschrift-Positionen enthaelt und eine Referenzrechnung existiert - sonst
# schlaegt die Erzeugung unabhaengig von der Syntax fehl.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${SALE_ORDER_ID:?Export SALE_ORDER_ID=<Auftrags-UUID>}"
curl -sS -X POST "${SHOPWARE_URL%/}/api/_action/order/document/credit_note/create" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d "[{\"orderId\":\"${SALE_ORDER_ID}\",\"type\":\"credit_note\",\"config\":{}}]"

