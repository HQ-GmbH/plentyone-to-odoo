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
# F008
#
# Odoo-Pendant:
# odoo/F008-stock-picking-done.sh
#
# Beschreibung:
# Kein separater 'erledigt'-Status: jede gebuchte Bewegung ist sofort final.
###############################################################################

echo "GAP: siehe F007. Jede Bewegung in stock/movements ist per Definition"
echo "bereits abgeschlossen ("done") - es gibt keinen Vorstufen-Status,"
echo "gegen den man filtern koennte. Alle Eintraege der Bewegungshistorie"
echo "entsprechen Odoos state="done"."

