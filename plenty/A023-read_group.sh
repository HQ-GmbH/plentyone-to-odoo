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
# A023
#
# Odoo-Pendant:
# odoo/A023-read_group.sh
#
# Shopware-Pendant:
# shopware/A023-read_group.sh
#
# Beschreibung:
# Kein Aequivalent: Plenty bietet keine generische Gruppierungs-/Aggregations-
# API.
#
# Migrationshinweis:
# Fuer ein Migrationstool bedeutet das: Reports/Statistiken, die in Odoo per
# read_group() serverseitig aggregiert werden, muessen bei einer Plenty-
# Anbindung clientseitig (oder ueber Plenty's separates Statistik-/BI-Modul,
# hier nicht untersucht) nachgebaut werden.
###############################################################################

echo "GAP: Plenty REST-API kennt kein Aequivalent zu read_group()."
echo "Gruppierung/Aggregation (z.B. Anzahl Kontakte je Typ) ist ausschliesslich"
echo "clientseitig moeglich: alle Seiten abrufen und lokal gruppieren, z.B. mit"
echo "jq: .entries | group_by(.typeId) | map({typeId: .[0].typeId, count: length})"

