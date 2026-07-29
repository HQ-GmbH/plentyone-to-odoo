#!/usr/bin/env bash
###############################################################################
# RabbitMQ Management API Reference
# PlentyOne -> Odoo 19 Enterprise Migration
# Copyright (c) 2026 HQ GmbH — https://www.hqgmbh.de
# Repository: https://github.com/hqgmbh/plenty-erp2odoo
# SPDX-License-Identifier: Apache-2.0
###############################################################################
source ../config.sh
# Voraussetzungen: RABBITMQ_URL, RABBITMQ_USER und RABBITMQ_PASSWORD in ../config.sh.
set -euo pipefail
: "${RABBITMQ_URL:?Set RABBITMQ_URL in config.sh}"
: "${RABBITMQ_USER:?Set RABBITMQ_USER in config.sh}"
: "${RABBITMQ_PASSWORD:?Set RABBITMQ_PASSWORD in config.sh}"
curl -sS --fail-with-body -u "${RABBITMQ_USER}:${RABBITMQ_PASSWORD}" "${RABBITMQ_URL%/}/api/users"
