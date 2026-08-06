#!/usr/bin/env bash
###############################################################################
# Shopware 6.7 Admin API Reference
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
# Christopher Einenkel
#
# Test-ID:
# E005
#
# Odoo-Pendant:
# odoo/E005-purchase-order-unlink.sh
#
# Plenty-Pendant:
# plenty/E005-purchase-order-unlink.sh
#
# Beschreibung:
# Kein Aequivalent zu Odoos purchase order unlink: Loescht einen
# Einkaufsauftrag.
#
# Migrationshinweis:
# Die gesamte E-Serie faellt bei Shopware weg, nicht nur einzelne Felder wie
# bei Plenty. Ein Migrationstool, das Odoo-Einkaufsdaten nach Shopware abbilden
# soll, braucht zwingend ein zusaetzliches, separates Beschaffungssystem (oder
# ein Drittanbieter-Plugin) - es gibt in Shopware selbst keinen Zielort dafuer,
# analog zum Buchhaltungsbefund bei Plenty (siehe MIGRATION_NOTES.md Abschnitt
# 7).
###############################################################################

echo "GAP: Shopware Core hat KEIN Einkaufs-/Beschaffungsmodell. Es gibt"
echo "keine Lieferanten-Entity (siehe B016), keine Purchase-Order-Entity"
echo "und keine Bestellauftraege-an-Lieferanten-Funktion irgendeiner Art."
echo "Die gesamte E-Serie ist damit strukturell nicht abbildbar - Shopware"
echo "ist eine Checkout-/Shopsoftware, kein ERP mit Beschaffungsseite."

