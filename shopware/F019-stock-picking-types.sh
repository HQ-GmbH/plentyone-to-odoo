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
# F019
#
# Odoo-Pendant:
# odoo/F019-stock-picking-types.sh
#
# Plenty-Pendant:
# plenty/F019-stock-picking-types.sh
#
# Beschreibung:
# Kein Aequivalent: kein Konzept fuer Lager-Operationstypen.
###############################################################################

echo "GAP: Ohne Warehouse-Entity im Core (siehe F001/F018) gibt es"
echo "erst recht keine Operationstypen (eingehend/ausgehend/intern)"
echo "darauf, wie Odoos stock.picking.type."

