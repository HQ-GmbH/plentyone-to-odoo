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
# Lukas Ehrenberg
#
# Test-ID:
# G012
#
# Odoo-Pendant:
# odoo/G012-account-move-lines.sh
#
# Plenty-Pendant:
# plenty/G012-account-move-lines.sh
#
# Beschreibung:
# Kein Aequivalent: keine Soll/Haben-Buchungszeilen vorhanden.
###############################################################################

echo "GAP: Es gibt keine account.move.line-Entsprechung - siehe G001."
echo "order-line-item (siehe D012) sind Auftragspositionen (Ware/Menge/"
echo "Preis), keine Kontobuchungen."

