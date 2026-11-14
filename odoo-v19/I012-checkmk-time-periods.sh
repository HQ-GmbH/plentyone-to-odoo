#!/usr/bin/env bash
###############################################################################
# Checkmk REST API Reference
# Technisches Referenzwerk: PlentyONE → Odoo 19 mit Shopware 6
# Copyright (c) 2026 HQ GmbH — https://www.hqgmbh.de
# Repository: https://github.com/hqgmbh/plentyone-to-odoo
# SPDX-License-Identifier: Apache-2.0
#
# Reviewed by:
# Mathias Goldhan
###############################################################################
source "$(dirname "${BASH_SOURCE[0]}")/../config.sh"
# Voraussetzungen: CHECKMK_URL, CHECKMK_SITE, CHECKMK_USER, CHECKMK_AUTOMATION_SECRET.
set -euo pipefail
: "${CHECKMK_URL:?Set CHECKMK_URL in config.sh}"
: "${CHECKMK_SITE:?Set CHECKMK_SITE in config.sh}"
: "${CHECKMK_USER:?Set CHECKMK_USER in config.sh}"
: "${CHECKMK_AUTOMATION_SECRET:?Set CHECKMK_AUTOMATION_SECRET in config.sh}"
curl -sS --fail-with-body -H "Authorization: Bearer ${CHECKMK_USER} ${CHECKMK_AUTOMATION_SECRET}" -H 'Accept: application/json' "${CHECKMK_URL%/}/${CHECKMK_SITE}/check_mk/api/1.0/domain-types/time_period/collections/all"
