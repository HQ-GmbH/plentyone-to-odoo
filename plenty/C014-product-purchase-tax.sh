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
# C014
#
# Odoo-Pendant:
# odoo/C014-product-purchase-tax.sh
#
# Shopware-Pendant:
# shopware/C014-product-purchase-tax.sh
#
# Beschreibung:
# Kein Aequivalent: Plenty kennt keinen separaten Einkaufssteuersatz.
#
# Migrationshinweis:
# Bei der Migration von Odoo nach Plenty (oder umgekehrt) muss
# supplier_taxes_id separat behandelt werden - es gibt kein Zielfeld dafuer in
# Plenty. Falls fachlich relevant, muss diese Information ausserhalb von Plenty
# (z.B. im Einkaufs-/Buchhaltungssystem) gehalten werden.
###############################################################################

echo "GAP: Plenty-Variationen haben nur EIN vatId-Feld fuer Verkauf UND Einkauf."
echo "Odoos Trennung von taxes_id (Verkauf) und supplier_taxes_id (Einkauf)"
echo "existiert in Plenty nicht - siehe C013 fuer das einzige vorhandene vatId-Feld."

