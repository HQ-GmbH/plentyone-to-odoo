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
# C010
#
# Odoo-Pendant:
# odoo/C010-product-type.sh
#
# Plenty-Pendant:
# plenty/C010-product-type.sh
#
# Beschreibung:
# Kein Aequivalent: Produkte haben kein Feld fuer Ware/Dienstleistung.
###############################################################################

echo "GAP: Das Product-Schema hat KEIN \"type\"-Feld fuer eine Achse"
echo "Ware/Dienstleistung/Kombireferenz wie Odoos detailed_type. Die"
echo "einzige strukturelle Unterscheidung ist parentId/children fuer"
echo "Variantenbeziehungen (z.B. T-Shirt in Groesse S/M/L), nicht fuer"
echo "Warenart. Nicht-lagerhaltige Dienstleistungen werden i.d.R. einfach"
echo "als gewoehnliches Produkt ohne Lagerverfolgung (Bestandsfeatures"
echo "deaktiviert) modelliert, nicht als eigener Typ."

