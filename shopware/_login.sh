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
# Gemeinsame Login-Hilfsfunktion fuer alle shopware/*.sh Testskripte.
#
# Shopware nutzt echtes OAuth2 (grant_type=client_credentials) gegen eine
# Integration (Administration -> Einstellungen -> System -> Integrationen).
# Der Access-Token ist mit 600 Sekunden (10 Minuten) sehr kurzlebig - beim
# client_credentials-Grant gibt es KEIN Refresh-Token, ein neuer Token wird
# einfach erneut per client_id/client_secret angefragt.
#
# Voraussetzung: ../config.sh setzt SHOPWARE_URL, SHOPWARE_CLIENT_ID,
# SHOPWARE_CLIENT_SECRET.
###############################################################################

: "${SHOPWARE_URL:?SHOPWARE_URL must be set in config.sh}"
: "${SHOPWARE_CLIENT_ID:?SHOPWARE_CLIENT_ID must be set in config.sh}"
: "${SHOPWARE_CLIENT_SECRET:?SHOPWARE_CLIENT_SECRET must be set in config.sh}"

SHOPWARE_LOGIN_RESPONSE=$(curl -sS -X POST "${SHOPWARE_URL%/}/api/oauth/token" \
  -H "Content-Type: application/json" \
  -d "{\"grant_type\":\"client_credentials\",\"client_id\":\"${SHOPWARE_CLIENT_ID}\",\"client_secret\":\"${SHOPWARE_CLIENT_SECRET}\"}")

SHOPWARE_ACCESS_TOKEN=$(echo "${SHOPWARE_LOGIN_RESPONSE}" | jq -r '.access_token // empty')

if [ -z "${SHOPWARE_ACCESS_TOKEN}" ]; then
  echo "Shopware-Login fehlgeschlagen: ${SHOPWARE_LOGIN_RESPONSE}" >&2
  exit 1
fi

export SHOPWARE_ACCESS_TOKEN
