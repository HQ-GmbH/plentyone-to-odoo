#!/usr/bin/env bash
###############################################################################
# Prometheus Performance API Reference
# Technisches Referenzwerk: PlentyONE → Odoo 19 mit Shopware 6
# Copyright (c) 2026 HQ GmbH — https://www.hqgmbh.de
# Repository: https://github.com/hqgmbh/plentyone-to-odoo
# SPDX-License-Identifier: Apache-2.0
###############################################################################
source "$(dirname "${BASH_SOURCE[0]}")/../config.sh"
# Voraussetzung: PROMETHEUS_URL in ../config.sh, z. B. http://prometheus:9090.
set -euo pipefail
: "${PROMETHEUS_URL:?Set PROMETHEUS_URL in config.sh}"
curl -sS --fail-with-body -G "${PROMETHEUS_URL%/}/api/v1/query" --data-urlencode 'query=sum(rate(rabbitmq_channel_messages_delivered_total[5m]))'
