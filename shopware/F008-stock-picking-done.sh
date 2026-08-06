#!/usr/bin/env bash
###############################################################################
# Shopware 6.7 Admin API Reference
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
# Christopher Einenkel
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

