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
# F009
#
# Odoo-Pendant:
# odoo/F009-stock-picking-cancel.sh
#
# Plenty-Pendant:
# plenty/F009-stock-picking-cancel.sh
#
# Beschreibung:
# Kein Aequivalent: kein Storno einer Bestandsbuchung moeglich, da keine
# einzelnen Buchungen existieren.
###############################################################################

echo "GAP: Da es keine einzelnen Buchungssaetze gibt (siehe F004), gibt"
echo "es auch nichts zu stornieren - nur ein erneutes PATCH auf den"
echo "vorherigen absoluten stock-Wert, falls dieser noch bekannt ist."

