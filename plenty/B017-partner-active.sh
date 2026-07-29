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
# B017
#
# Odoo-Pendant:
# odoo/B017-partner-active.sh
#
# Shopware-Pendant:
# shopware/B017-partner-active.sh
#
# Beschreibung:
# Kein Aequivalent: Plenty-Kontakte kennen kein active/archiviert-Flag.
#
# Migrationshinweis:
# Wichtig fuer das Migrationstool: Odoos 'Soft-Delete via active=false' Pattern
# (haeufig genutzt fuer DSGVO-konforme Historie) hat in Plenty keine
# dokumentierte Entsprechung. Loeschstrategien muessen neu durchdacht werden,
# insbesondere im Hinblick auf Aufbewahrungspflichten.
###############################################################################

echo "GAP: res.partner.active hat keine Entsprechung am Plenty-Contact."
echo "In der OpenAPI-Spec (Contact-Schema) existiert kein active/isActive-Feld."
echo "Ein geloeschter Kontakt (DELETE) ist vermutlich unwiderruflich entfernt,"
echo "nicht nur archiviert - UNVERIFIZIERT, empirisch pruefen vor Migration."

