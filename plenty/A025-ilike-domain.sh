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
# A025
#
# Odoo-Pendant:
# odoo/A025-ilike-domain.sh
#
# Shopware-Pendant:
# shopware/A025-ilike-domain.sh
#
# Beschreibung:
# Sucht Kontakte per unscharfem E-Mail-Abgleich (ilike-Aequivalent).
#
# Migrationshinweis:
# contactEmail ist laut Doku explizit eine 'resembling'-Suche (Teiltreffer), im
# Unterschied zu email (exakter Treffer, siehe B010). Das ist der direkte
# Ersatz fuer Odoos ilike-Domain-Operator - allerdings nur fuer dieses eine
# Feld, nicht generisch fuer beliebige Felder wie bei Odoo.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X GET "${PLENTY_URL%/}/rest/accounts/contacts?contactEmail=example.com" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"

