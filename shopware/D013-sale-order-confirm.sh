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
# D013
#
# Odoo-Pendant:
# odoo/D013-sale-order-confirm.sh
#
# Plenty-Pendant:
# plenty/D013-sale-order-confirm.sh
#
# Beschreibung:
# Setzt den Auftragsstatus auf die naechste Transition (process).
#
# Migrationshinweis:
# "process" ist die Standard-Transition der order.state-Maschine fuer
# open->in_progress. Im OpenAPI-Schema ist sie nicht als Enum hinterlegt - der
# Pfad akzeptiert {transition} als freien String-Parameter, die gueltigen Namen
# stehen also nicht im Schema. Fuer ein Migrationstool trotzdem die verfuegbaren
# Transitions je Auftrag abfragen, statt den Namen hart zu kodieren: die
# State-Maschine ist je Instanz erweiterbar. Der Abfragepfad dafuer ist
# GET /api/_action/state-machine/order/{orderId}/state - ein GET auf
# /api/_action/order/{orderId}/state existiert NICHT, dieser Pfad kennt laut
# Spec nur POST mit {transition}.
#
# Anders als Odoos action_confirm() (eine Methode am Modell) ist der
# Statuswechsel bei Shopware ein eigener Aktions-Endpunkt.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${SALE_ORDER_ID:?Export SALE_ORDER_ID=<Auftrags-UUID eines Testauftrags>}"
curl -sS -X POST "${SHOPWARE_URL%/}/api/_action/order/${SALE_ORDER_ID}/state/process" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}"

