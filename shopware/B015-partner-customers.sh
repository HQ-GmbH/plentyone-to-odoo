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
# B015
#
# Odoo-Pendant:
# odoo/B015-partner-customers.sh
#
# Beschreibung:
# Trivial: die gesamte customer-Entity ist per Definition Kunden.
#
# Migrationshinweis:
# Das invertiert das bei Plenty/Odoo beobachtete Problem: dort musste 'Kunde'
# erst per Rang/typeId aus einer gemischten Tabelle herausgefiltert werden. Bei
# Shopware ist die Trennung strukturell bereits vorgegeben (customer-Entity =
# ausschliesslich Kunden), dafuer fehlt umgekehrt jedes Konzept fuer
# Lieferanten (siehe B016).
###############################################################################

echo "Trivial: In Shopware ist JEDER Datensatz in customer per Definition"
echo "ein Kunde - es gibt kein customer_rank-Feld und keine gemischte"
echo "Tabelle wie Odoos res.partner. Ein Filter \"nur Kunden\" entfaellt,"
echo "eine einfache Liste (siehe A004) reicht."

