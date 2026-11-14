#!/usr/bin/env bash
###############################################################################
# RabbitMQ Management API Reference
# Technisches Referenzwerk: PlentyONE → Odoo 19 mit Shopware 6
# Copyright (c) 2026 HQ GmbH — https://www.hqgmbh.de
# Repository: https://github.com/hqgmbh/plentyone-to-odoo
# SPDX-License-Identifier: Apache-2.0
#
# Reviewed by:
# Mathias Goldhan
###############################################################################
source "$(dirname "${BASH_SOURCE[0]}")/../config.sh"
# Voraussetzungen: RABBITMQ_URL, RABBITMQ_USER und RABBITMQ_PASSWORD in ../config.sh.
set -euo pipefail
: "${RABBITMQ_URL:?Set RABBITMQ_URL in config.sh}"
: "${RABBITMQ_USER:?Set RABBITMQ_USER in config.sh}"
: "${RABBITMQ_PASSWORD:?Set RABBITMQ_PASSWORD in config.sh}"
curl -sS --fail-with-body -u "${RABBITMQ_USER}:${RABBITMQ_PASSWORD}" "${RABBITMQ_URL%/}/api/channels"
