#!/usr/bin/env bash
# Prometheus Performance API Reference
#
# Reviewed by:
# Mathias Goldhan
source ../config.sh
set -euo pipefail
: "${PROMETHEUS_URL:?Set PROMETHEUS_URL in config.sh}"
curl -sS --fail-with-body "${PROMETHEUS_URL%/}/api/v1/status/buildinfo"
