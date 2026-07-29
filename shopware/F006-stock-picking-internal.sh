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
# Test-ID:
# F006
#
# Odoo-Pendant:
# odoo/F006-stock-picking-internal.sh
#
# Plenty-Pendant:
# plenty/F006-stock-picking-internal.sh
#
# Beschreibung:
# Kein Aequivalent: keine Mehrlagerverwaltung im Core, daher keine internen
# Umlagerungen.
###############################################################################

echo "GAP: siehe F001 - ohne Mehrlagerverwaltung im Core gibt es auch"
echo "keine \"Umlagerung zwischen Lagern\", da es nur EIN globales"
echo "stock-Feld pro Produkt gibt, kein Lager-spezifisches."

