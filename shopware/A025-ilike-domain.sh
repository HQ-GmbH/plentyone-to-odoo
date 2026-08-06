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
# A025
#
# Odoo-Pendant:
# odoo/A025-ilike-domain.sh
#
# Plenty-Pendant:
# plenty/A025-ilike-domain.sh
#
# Beschreibung:
# Sucht Kunden per unscharfem E-Mail-Abgleich (ilike-Aequivalent).
#
# Migrationshinweis:
# Anders als bei Plenty (nur einzelne Felder wie contactEmail haben eine fuzzy-
# Variante) funktioniert "contains" bei Shopware GENERISCH auf jedem String-
# Feld - naeher an Odoos generischem ilike-Operator.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X POST "${SHOPWARE_URL%/}/api/search/customer" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d '{"filter":[{"type":"contains","field":"email","value":"example.com"}]}'

