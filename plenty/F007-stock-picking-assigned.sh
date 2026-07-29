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
# F007
#
# Odoo-Pendant:
# odoo/F007-stock-picking-assigned.sh
#
# Shopware-Pendant:
# shopware/F007-stock-picking-assigned.sh
#
# Beschreibung:
# Kein Aequivalent: Plenty-Buchungen kennen keinen
# 'reserviert/bereit'-Zwischenzustand.
###############################################################################

echo "GAP: Odoos stock.picking-Status assigned (Ware reserviert, bereit zum"
echo "Versand/Abholen) setzt einen mehrstufigen Beleg-Workflow voraus, den"
echo "Plenty nicht hat (siehe F001-Migrationshinweis). Buchungen sind sofort"
echo "final. Der naechstliegende Ersatz ist der Lagerbestand selbst (netStock"
echo "> 0 = 'koennte reserviert werden'), siehe F013/F015."

