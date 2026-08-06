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
# https://github.com/hqgmbh/plentyone-to-odoo
#
# SPDX-License-Identifier: Apache-2.0
#
# Reviewed by:
# Christopher Einenkel
#
# Test-ID:
# B013
#
# Odoo-Pendant:
# odoo/B013-partner-contacts.sh
#
# Plenty-Pendant:
# plenty/B013-partner-contacts.sh
#
# Beschreibung:
# Kein Aequivalent: Shopware-Kunden haben keine Eltern-Kind-Hierarchie zwischen
# Kundendatensaetzen.
#
# Migrationshinweis:
# Jeder Ansprechpartner einer Firma muesste bei Shopware als eigener,
# unabhaengiger Customer-Datensatz mit identischem company-Freitext angelegt
# werden - keine Modellierung als echte Beziehung wie bei Odoos parent_id oder
# Plentys Account-Verknuepfung.
###############################################################################

echo "GAP: Shopware kennt kein parent_id-Aequivalent zwischen Customer-"
echo "Datensaetzen. Ein Firmenkunde hat ein Freitextfeld \"company\", aber"
echo "keine strukturelle Verknuepfung zu weiteren Ansprechpartnern"
echo "derselben Firma als eigene Customer-Datensaetze."

