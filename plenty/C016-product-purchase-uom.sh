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
# C016
#
# Odoo-Pendant:
# odoo-v20/C016-product-purchase-uom.sh
#
# Shopware-Pendant:
# shopware/C016-product-purchase-uom.sh
#
# Beschreibung:
# Kein Aequivalent: Plenty kennt keine separate Einkaufseinheit.
###############################################################################

echo "GAP: Plenty-Variationen haben nur EIN unit-Feld (siehe C015)."
echo "Odoos Trennung von uom_id (Verkauf) und uom_po_id (Einkauf) existiert"
echo "in Plenty nicht. Verpackungseinheiten (unitsContained/packingUnits)"
echo "bilden etwas anderes ab: Gebindegroessen, nicht eine zweite Masseinheit."

