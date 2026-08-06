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
# C010
#
# Odoo-Pendant:
# odoo/C010-product-type.sh
#
# Plenty-Pendant:
# plenty/C010-product-type.sh
#
# Beschreibung:
# Gruppiert Produkte nach dem Feld 'type' (physical/digital).
#
# Migrationshinweis:
# Shopware 6.7 HAT ein type-Feld am Produkt, aber mit anderer Achse als Odoo: es
# unterscheidet 'physical' und 'digital' (Enum laut Schema, Default 'physical'),
# also die Auslieferungsart. Odoos detailed_type unterscheidet dagegen
# Ware/Dienstleistung/Kombireferenz. Eine Dienstleistung ist bei Shopware also
# KEIN eigener type-Wert, sondern wird als Produkt ohne Lagerverfolgung
# modelliert. Das Feld ist immutable - nach dem Anlegen nicht mehr aenderbar.
#
# Andere Achsen nicht verwechseln: parentId/children bildet Variantenbeziehungen
# ab (T-Shirt in S/M/L), nicht die Warenart. Das aeltere Feld 'states' existiert
# noch, ist aber zugunsten von 'type' abgekuendigt.
#
# Fuer das Migrationstool: Odoos detailed_type braucht eine ZWEI-Felder-Abbildung
# (type fuer physical/digital plus Lager-/Versandeinstellungen fuer den
# Dienstleistungscharakter), kein 1:1-Mapping.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID, SHOPWARE_CLIENT_SECRET.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

curl -sS -X POST "${SHOPWARE_URL%/}/api/aggregate/product" -H "Content-Type: application/json" -H "Authorization: Bearer ${SHOPWARE_ACCESS_TOKEN}" -d '{"aggregations":[{"name":"per-type","type":"terms","field":"type"}],"limit":1}'
