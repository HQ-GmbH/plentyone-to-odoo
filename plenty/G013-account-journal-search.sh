#!/usr/bin/env bash
###############################################################################
# Plenty REST API Reference
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
# Lukas Ehrenberg
#
# Test-ID:
# G013
#
# Odoo-Pendant:
# odoo-v20/G013-account-journal-search.sh
#
# Shopware-Pendant:
# shopware/G013-account-journal-search.sh
#
# Beschreibung:
# Kein Aequivalent: kein Journal-Konzept vorhanden.
###############################################################################

echo "GAP: kein /rest/-Endpunkt fuer Journale (Verkauf/Einkauf/Bank/Kasse)."
echo "Die einzige buchhaltungsnahe Konfiguration ist der Buchhaltungs-Export:"
echo "  GET /rest/accounting/locations/posting_accounts"
echo "Das bildet aber Konten fuer einen EXTERNEN Export ab, keine internen"
echo "Journale mit eigenen Buchungen."

