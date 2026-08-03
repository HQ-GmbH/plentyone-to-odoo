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
# UNVERIFIZIERT: der exakte technicalName der Transition (hier "process" fuer
# open->in_progress angenommen) stammt aus allgemeinem Shopware-Fachwissen zu
# den Standard-Transitions der order.state-Maschine, war im ausgewerteten
# OpenAPI-Schema selbst aber nicht als Enum hinterlegt (der Pfad akzeptiert
# {transition} als freien String-Parameter). Verfuegbare Transitions fuer einen
# konkreten Auftrag vorher per GET /api/_action/order/{id}/state abfragen,
# statt den Namen hart zu kodieren.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${SALE_ORDER_ID:?Export SALE_ORDER_ID=<Auftrags-UUID eines Testauftrags>}"
curl -sS -X POST "${SHOPWARE_URL%/}/api/_action/order/${SALE_ORDER_ID}/state/process" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}"

