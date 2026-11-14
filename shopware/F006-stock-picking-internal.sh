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
# F006
#
# Odoo-Pendant:
# odoo-v20/F006-stock-picking-internal.sh
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

