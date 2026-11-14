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
# F008
#
# Odoo-Pendant:
# odoo-v20/F008-stock-picking-done.sh
#
# Shopware-Pendant:
# shopware/F008-stock-picking-done.sh
#
# Beschreibung:
# Kein separater 'erledigt'-Status: jede gebuchte Bewegung ist sofort final.
###############################################################################

echo "GAP: siehe F007. Jede Bewegung in stock/movements ist per Definition"
echo "bereits abgeschlossen ("done") - es gibt keinen Vorstufen-Status,"
echo "gegen den man filtern koennte. Alle Eintraege der Bewegungshistorie"
echo "entsprechen Odoos state="done"."

