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
# F008
#
# Odoo-Pendant:
# odoo/F008-stock-picking-done.sh
#
# Plenty-Pendant:
# plenty/F008-stock-picking-done.sh
#
# Beschreibung:
# Kein Aequivalent: keine Bewegungshistorie mit einem 'erledigt'-Status.
###############################################################################

echo "GAP: Es gibt keine Bestandsbewegungs-Entity im Core und damit"
echo "keinen Status \"done\" darauf - nur den aktuellen stock-Zahlenwert."

