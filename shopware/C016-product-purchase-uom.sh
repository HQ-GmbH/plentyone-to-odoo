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
# C016
#
# Odoo-Pendant:
# odoo/C016-product-purchase-uom.sh
#
# Plenty-Pendant:
# plenty/C016-product-purchase-uom.sh
#
# Beschreibung:
# Kein Aequivalent: keine separate Einkaufseinheit, nur eine numerische
# Grundpreismenge.
###############################################################################

echo "GAP: purchaseUnit/referenceUnit (siehe C015) sind Zahlen fuer die"
echo "Grundpreisanzeige (z.B. Preis pro 100ml), KEINE zweite"
echo "Masseinheit-Referenz wie Odoos uom_po_id. Es existiert nur ein"
echo "einziges unitId-Feld am Produkt - identische Luecke wie bei Plenty."

