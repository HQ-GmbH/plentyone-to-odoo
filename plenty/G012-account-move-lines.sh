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
# G012
#
# Odoo-Pendant:
# odoo/G012-account-move-lines.sh
#
# Shopware-Pendant:
# shopware/G012-account-move-lines.sh
#
# Beschreibung:
# Kein Aequivalent: keine Soll/Haben-Buchungszeilen vorhanden.
###############################################################################

echo "GAP: Es gibt keine account.move.line-Entsprechung. Plenty fuehrt keine"
echo "Soll/Haben-Buchungszeilen (debit/credit/balance je Konto). Die einzigen"
echo "granularen Finanzdaten sind einzelne Payment-Datensaetze (siehe G001)"
echo "und orderItems (Warenwert je Position, keine Kontobuchung)."

