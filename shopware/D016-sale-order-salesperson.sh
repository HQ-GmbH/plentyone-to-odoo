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
# D016
#
# Odoo-Pendant:
# odoo/D016-sale-order-salesperson.sh
#
# Plenty-Pendant:
# plenty/D016-sale-order-salesperson.sh
#
# Beschreibung:
# Kein Aequivalent: Shopware kennt keine interne Vertriebsperson-Zuordnung am
# Auftrag.
###############################################################################

echo "GAP: Das Order-Schema hat kein user_id/salesperson-Feld. Shopware"
echo "ist Checkout-/Shopsoftware - Auftraege entstehen durch den Kunden"
echo "selbst im Shop, nicht durch einen internen Vertriebsmitarbeiter,"
echo "der einen Auftrag im Namen eines Kunden anlegt und sich selbst"
echo "zuordnet."

