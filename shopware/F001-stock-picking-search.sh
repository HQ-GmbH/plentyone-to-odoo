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
# Reviewed by:
# Christopher Einenkel
#
# Test-ID:
# F001
#
# Odoo-Pendant:
# odoo/F001-stock-picking-search.sh
#
# Plenty-Pendant:
# plenty/F001-stock-picking-search.sh
#
# Beschreibung:
# Kein Aequivalent: Shopware Core hat kein Transferbeleg-/Picking-Konzept.
#
# Migrationshinweis:
# Im OpenAPI-Schema existieren bereits die Schema-DEFINITIONEN
# Warehouse/WarehouseGroup/ProductWarehouse/OrderProductWarehouse - aber OHNE
# zugehoerige HTTP-Pfade und ohne jede Verknuepfung vom Product-Schema aus. Im
# Schema des kostenpflichtigen Commercial-Plugins sind exakt dieselben Entities
# voll ausgestattet (/api/warehouse etc.). Multi-Warehouse ist damit ein reines
# Commercial-Feature, nicht Teil des Open-Source-Cores - relevant fuer die
# Kostenplanung eines Migrationstools, falls Mehrlager-Funktionalitaet
# gebraucht wird.
###############################################################################

echo "GAP: Es gibt keine Picking-/Transfer-Entity und keine"
echo "Bestandsbewegungshistorie im Shopware Core - nur ein einzelnes"
echo "stock-Integer-Feld direkt am Produkt (siehe C002/F013)."

