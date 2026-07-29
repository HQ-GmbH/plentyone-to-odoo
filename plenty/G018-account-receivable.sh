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
# G018
#
# Odoo-Pendant:
# odoo/G018-account-receivable.sh
#
# Shopware-Pendant:
# shopware/G018-account-receivable.sh
#
# Beschreibung:
# Kein Aequivalent: kein Debitorenkonto/Forderungssaldo in Plenty selbst.
###############################################################################

echo "GAP: Es gibt kein Debitorenkonto mit Saldo wie Odoos account.account"
echo "(account_type=asset_receivable). Der Contact hat zwar Zahlungsfelder"
echo "(discountDays, discountPercent, timeForPaymentAllowedDays, bookAccount),"
echo "aber keinen laufenden Saldo - das sind nur Konditionen, keine Buchhaltung."

