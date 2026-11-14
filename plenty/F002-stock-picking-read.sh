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
# F002
#
# Odoo-Pendant:
# odoo-v20/F002-stock-picking-read.sh
#
# Shopware-Pendant:
# shopware/F002-stock-picking-read.sh
#
# Beschreibung:
# Liest die juengste Bestandsbewegung eines Lagers.
#
# Migrationshinweis:
# Kein Einzel-GET per Bewegungs-ID dokumentiert - nur Listen mit Filtern
# (variationId, reasonId, Zeitraum). Odoos stock.picking.read(id) hat damit
# kein direktes 1:1-Pendant.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

: "${WAREHOUSE_ID:?Export WAREHOUSE_ID=<Lager-ID>}"
curl -sS -X GET "${PLENTY_URL%/}/rest/stockmanagement/warehouses/${WAREHOUSE_ID}/stock/movements?itemsPerPage=1" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

