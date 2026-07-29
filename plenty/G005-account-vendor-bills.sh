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
# G005
#
# Odoo-Pendant:
# odoo/G005-account-vendor-bills.sh
#
# Beschreibung:
# Kein Aequivalent: Plenty kennt kein Lieferantenrechnungs-/Bill-Konzept.
###############################################################################

echo "GAP: Es existiert kein Endpunkt fuer Eingangsrechnungen/Vendor Bills."
echo "Weder /rest/payments noch /rest/orders bilden eine Kreditoren-Rechnung"
echo "mit Fälligkeit/Zahlungsziel wie Odoos account.move (move_type=in_invoice)"
echo "ab. Dieser Geschaeftsvorgang muss vollstaendig im nachgelagerten"
echo "Buchhaltungssystem (z.B. DATEV) gefuehrt werden, an das Plenty per"
echo "/rest/accounting/... nur Konfigurationsdaten fuer den Export liefert."

