#!/usr/bin/env bash
###############################################################################
# Odoo 19 JSON-2 API Reference
#
# Companion Repository to the reference book
# "PlentyOne → Odoo 19 Enterprise Migration"
#
# Copyright (c) 2026 HQ GmbH
# https://www.hqgmbh.de
#
# Repository
# https://github.com/hqgmbh/plentyone-to-odoo
#
# Author
# Mathias Goldhan
#
# SPDX-License-Identifier: Apache-2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#
# This example has been practically validated against Odoo 19 and is part of
# the official API reference implementation published by HQ GmbH.
###############################################################################

export ODOO_URL="https://odoo.example.com"
export ODOO_API_KEY="YOUR_API_KEY"

# Plenty REST API (siehe ../plenty) - Login statt statischem API-Key.
export PLENTY_URL="https://p12345.my.plentysystems.com"
export PLENTY_USERNAME="YOUR_BACKEND_USERNAME"
export PLENTY_PASSWORD="YOUR_BACKEND_PASSWORD"

# Shopware 6.7 Admin API (siehe ../shopware) - OAuth2 client_credentials.
export SHOPWARE_URL="https://shop.example.com"
export SHOPWARE_CLIENT_ID="YOUR_INTEGRATION_CLIENT_ID"
export SHOPWARE_CLIENT_SECRET="YOUR_INTEGRATION_CLIENT_SECRET"
