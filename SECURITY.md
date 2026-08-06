# Security Policy

## Reporting a Vulnerability

Please report security issues privately to **info@hqgmbh.de** rather than
opening a public issue.

Please include

- The affected script or file
- Steps to reproduce
- The impact you expect

You will receive an acknowledgement within five business days.

## Scope

This repository contains reference scripts that call the Odoo, PlentyONE and
Shopware APIs. Relevant reports include

- Credentials or tokens committed to this repository
- A script that leaks credentials, for example into a URL or a log file
- A script that performs a destructive operation its documentation does not
  announce

Vulnerabilities in Odoo, PlentyONE or Shopware themselves belong to the
respective vendor.

## Handling Credentials

No credentials belong in this repository. All scripts read them from
`config.sh`, which is excluded via `.gitignore`. Never commit that file.
