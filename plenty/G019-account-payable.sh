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
# https://github.com/hqgmbh/plentyone-to-odoo
#
# SPDX-License-Identifier: Apache-2.0
#
# Reviewed by:
# Lukas Ehrenberg
#
# Test-ID:
# G019
#
# Odoo-Pendant:
# odoo/G019-account-payable.sh
#
# Shopware-Pendant:
# shopware/G019-account-payable.sh
#
# Beschreibung:
# Kein Aequivalent: kein Kreditorenkonto/Verbindlichkeitensaldo in Plenty
# selbst.
###############################################################################

echo "GAP: siehe G018 - dasselbe gilt spiegelbildlich fuer Verbindlichkeiten"
echo "gegenueber Lieferanten (Odoos account_type=liability_payable)."

