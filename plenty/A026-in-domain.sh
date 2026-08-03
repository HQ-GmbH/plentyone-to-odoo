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
# Reviewed by:
# Lukas Ehrenberg
#
# Test-ID:
# A026
#
# Odoo-Pendant:
# odoo/A026-in-domain.sh
#
# Shopware-Pendant:
# shopware/A026-in-domain.sh
#
# Beschreibung:
# Liest mehrere Kontakte per ID (kein serverseitiger IN-Filter vorhanden).
#
# Migrationshinweis:
# GET /rest/accounts/contacts kennt keinen 'id in [...]'-Filter (nur contactId
# fuer genau EINE ID). Odoos [('id','in',[1,9,15])] muss bei Plenty durch
# mehrere Einzel-GETs (wie hier) oder durch vollstaendiges Laden +
# clientseitiges Filtern nachgebildet werden - relevant fuer die Performance-
# Planung des Migrationstools bei grossen ID-Listen.
###############################################################################

source ../config.sh
source ./_login.sh
# Voraussetzungen: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
# Hinweis: Weitere IDs oder Suchwerte sind ausschließlich mit Testdaten zu setzen.

for id in 1 9 15; do
  curl -sS -X GET "${PLENTY_URL%/}/rest/accounts/contacts/${id}" -H "Authorization: Bearer ${PLENTY_ACCESS_TOKEN}"
  echo
done

