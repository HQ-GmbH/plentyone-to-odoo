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
# D019
#
# Odoo-Pendant:
# odoo/D019-sale-order-invoices.sh
#
# Plenty-Pendant:
# plenty/D019-sale-order-invoices.sh
#
# Beschreibung:
# Erzeugt das Rechnungsdokument (PDF) eines Auftrags.
#
# Migrationshinweis:
# Wie bei Plenty (POST .../documents/invoice/generate) erzeugt Shopware nur ein
# PDF-DOKUMENT (document-Entity mit Verweis auf eine media-Datei) ohne eigenen
# Buchungssatz dahinter - keines der drei APIs bildet Odoos account.move nach.
#
# Zum Body-Format - hier weicht die Instanz vom Schema ab: das OpenAPI-Schema
# deklariert ein ARRAY von Auftraegen mit orderId UND type als Pflichtfeld je
# Eintrag. Gegen eine echte Instanz genuegt jedoch ein einzelnes Objekt ohne
# type, wie hier gezeigt - der Dokumenttyp steht bereits als documentTypeName
# im Pfad. Weitere Felder: fileType (Default pdf), static,
# referencedDocumentId, config (documentNumber, documentDate etc.).
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${SALE_ORDER_ID:?Export SALE_ORDER_ID=<Auftrags-UUID>}"
curl -sS -X POST "${SHOPWARE_URL%/}/api/_action/order/document/invoice/create" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d "{\"orderId\":\"${SALE_ORDER_ID}\",\"fileType\":\"pdf\",\"config\":{}}"

