#!/usr/bin/env bash
###############################################################################
# Plenty REST API Reference
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
# C016
#
# Odoo-Pendant:
# odoo/C016-product-purchase-uom.sh
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

