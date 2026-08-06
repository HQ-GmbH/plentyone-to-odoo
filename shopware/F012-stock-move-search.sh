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
# https://github.com/hqgmbh/plentyone-to-odoo
#
# SPDX-License-Identifier: Apache-2.0
#
# Reviewed by:
# Christopher Einenkel
#
# Test-ID:
# F012
#
# Odoo-Pendant:
# odoo/F012-stock-move-search.sh
#
# Plenty-Pendant:
# plenty/F012-stock-move-search.sh
#
# Beschreibung:
# Kein Aequivalent: keine granulare Bewegungs-Entity pro Produkt.
###############################################################################

echo "GAP: siehe F001 - Odoos stock.move (einzelne Bewegung innerhalb"
echo "eines Belegs) hat keine Entsprechung, da es im Core weder Belege"
echo "noch Einzelbewegungen gibt, nur den aktuellen Summenwert stock."

