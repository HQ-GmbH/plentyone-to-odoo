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
# Christopher Einenkel
#
# Test-ID:
# C014
#
# Odoo-Pendant:
# odoo/C014-product-purchase-tax.sh
#
# Plenty-Pendant:
# plenty/C014-product-purchase-tax.sh
#
# Beschreibung:
# Kein Aequivalent: Produkte haben nur EIN taxId-Feld fuer Verkauf UND Einkauf.
###############################################################################

echo "GAP: Genau wie bei Plenty gibt es nur EIN taxId-Feld am Produkt."
echo "Odoos Trennung von taxes_id (Verkauf) und supplier_taxes_id"
echo "(Einkauf) existiert bei Shopware nicht - ohnehin gibt es keinen"
echo "Einkaufsvorgang im Core (siehe B016/E-Serie)."

