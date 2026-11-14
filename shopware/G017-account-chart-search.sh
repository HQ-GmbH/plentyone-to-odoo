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
# G017
#
# Odoo-Pendant:
# odoo-v20/G017-account-chart-search.sh
#
# Plenty-Pendant:
# plenty/G017-account-chart-search.sh
#
# Beschreibung:
# Kein Aequivalent: kein Kontenplan und keine Buchhaltungs-Export-Konfiguration
# im Core.
###############################################################################

echo "GAP: Anders als Plenty (das zumindest eine Konto-Export-Mapping-"
echo "Konfiguration unter /rest/accounting/... hat) bietet der Shopware"
echo "Core UEBERHAUPT KEINE Kontenplan-/Buchhaltungs-Export-Struktur."
echo "Diese Luecke ist bei Shopware also noch groesser als bei Plenty."

