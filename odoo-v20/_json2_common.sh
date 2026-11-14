#!/usr/bin/env bash
# Shared Odoo JSON-2 client safeguards. This file is sourced by the API tests.
# It loads ../config.sh relative to this folder, so every test can be started
# from any working directory (e.g. ./odoo-v20/A005-search_read.sh).

set -euo pipefail

# shellcheck source=/dev/null
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../config.sh"

: "${ODOO_URL:?ODOO_URL must be set in config.sh}"
: "${ODOO_API_KEY:?ODOO_API_KEY must be set in config.sh}"

# Prevent a configured trailing slash from creating a non-canonical //json/2 URL.
ODOO_URL="${ODOO_URL%/}"
export ODOO_URL

_odoo_json2_headers=(
  -H "User-Agent: ${ODOO_USER_AGENT:-HQGmbH plentyone-to-odoo/20}"
)

# Required for multi-database deployments when the host name is not enough to
# select the database. Omit the header completely for single-database setups.
if [[ -n "${ODOO_DATABASE:-}" ]]; then
  _odoo_json2_headers+=(-H "X-Odoo-Database: ${ODOO_DATABASE}")
fi

# Keep the individual test payloads and their explicit authentication headers
# readable while applying the common transport headers consistently.
curl() {
  command curl --silent --show-error "${_odoo_json2_headers[@]}" "$@"
}

# Record ids are interpolated into JSON bodies. Abort before the request unless
# the named variable holds a positive integer, so values like "1,2,3" can never
# widen an unlink or write call.
odoo_require_id() {
  local name="$1"
  local value="${!1:-}"
  if [[ ! "$value" =~ ^[1-9][0-9]*$ ]]; then
    printf '%s must be a positive integer record id, got: "%s"\n' "$name" "$value" >&2
    exit 64
  fi
}

# Same check for limit/offset values, where 0 is allowed.
odoo_require_uint() {
  local name="$1"
  local value="${!1:-}"
  if [[ ! "$value" =~ ^(0|[1-9][0-9]*)$ ]]; then
    printf '%s must be a non-negative integer, got: "%s"\n' "$name" "$value" >&2
    exit 64
  fi
}

# Print the argument as a JSON string literal including the quotes, so search
# values from the environment cannot change the structure of a domain.
# Use it in an assignment (X_JSON="$(odoo_json_string "$X")"): with set -e a
# rejected value then stops the script before any request is sent.
odoo_json_string() {
  if [[ "$1" =~ [[:cntrl:]] ]]; then
    printf 'Control characters are not allowed in search values\n' >&2
    return 64
  fi
  # sed instead of ${var//...}: replacement quoting differs between bash 3.2
  # (macOS default) and bash 5.x.
  printf '"%s"' "$(printf '%s' "$1" | sed -e 's/\\/\\\\/g' -e 's/"/\\"/g')"
}
