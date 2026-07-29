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
# B016
#
# Odoo-Pendant:
# odoo/B016-partner-suppliers.sh
#
# Plenty-Pendant:
# plenty/B016-partner-suppliers.sh
#
# Beschreibung:
# Kein Aequivalent: Shopware Core hat kein Lieferanten-/Vendor-Konzept.
#
# Migrationshinweis:
# Shopware ist eine Shop-/Checkout-Software, kein ERP - es gibt im Core
# keinerlei Beschaffungs-/Einkaufsseite. Siehe E-Serie fuer die volle Tragweite
# dieser Luecke bei Bestellungen.
###############################################################################

echo "GAP: Kein Endpunkt fuer Lieferanten. Weder \"vendor\" noch \"supplier\""
echo "kommen im gesamten Admin-API-Schema vor (665 Pfade durchsucht)."
echo "product-manufacturer (Hersteller/Marke) ist NICHT dasselbe - das ist"
echo "reine Marketinginfo (Name, Logo, Link), kein Einkaufs-/Adresskonzept."

