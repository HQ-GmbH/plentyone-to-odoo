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
# Gemeinsame Login-Hilfsfunktion fuer alle plenty/*.sh Testskripte.
#
# Anders als Odoo (statischer API-Key) verlangt die Plenty REST-API einen
# Login gegen POST /rest/login, der einen 24h gueltigen Bearer-Token liefert.
# Dieses Skript wird von jedem Testskript per `source ./_login.sh` eingebunden
# und exportiert PLENTY_ACCESS_TOKEN fuer die nachfolgenden curl-Aufrufe.
#
# Voraussetzung: ../config.sh setzt PLENTY_URL, PLENTY_USERNAME, PLENTY_PASSWORD.
###############################################################################

: "${PLENTY_URL:?PLENTY_URL must be set in config.sh}"
: "${PLENTY_USERNAME:?PLENTY_USERNAME must be set in config.sh}"
: "${PLENTY_PASSWORD:?PLENTY_PASSWORD must be set in config.sh}"

PLENTY_LOGIN_RESPONSE=$(curl -sS -X POST "${PLENTY_URL%/}/rest/login" \
  -H "Content-Type: application/json" \
  -d "{\"username\":\"${PLENTY_USERNAME}\",\"password\":\"${PLENTY_PASSWORD}\"}")

PLENTY_ACCESS_TOKEN=$(echo "${PLENTY_LOGIN_RESPONSE}" | jq -r '.access_token // empty')

if [ -z "${PLENTY_ACCESS_TOKEN}" ]; then
  echo "Plenty-Login fehlgeschlagen: ${PLENTY_LOGIN_RESPONSE}" >&2
  exit 1
fi

export PLENTY_ACCESS_TOKEN
