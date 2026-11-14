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
# B017
#
# Odoo-Pendant:
# odoo-v20/B017-partner-active.sh
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
echo "Ein geloeschter Kontakt (DELETE) ist unwiderruflich entfernt, nicht nur"
echo "archiviert."

