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
# F007
#
# Odoo-Pendant:
# odoo/F007-stock-picking-assigned.sh
#
# Plenty-Pendant:
# plenty/F007-stock-picking-assigned.sh
#
# Beschreibung:
# Kein Aequivalent: kein Reservierungs-/Picking-Zwischenstatus.
###############################################################################

echo "GAP: Es gibt keinen Picking-Workflow und damit keinen"
echo "Zwischenstatus \"reserviert/bereit zum Versand\" auf Lagerebene."
echo "Der naechstliegende Ersatz ist availableStock (siehe F013):"
echo "stock minus bereits in offenen Bestellungen gebundene Menge."

