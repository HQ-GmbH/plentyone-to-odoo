# Plenty REST API Reference Tests

Gegenstück zu [`../odoo`](../odoo) - dieselben Test-IDs, dieselbe Struktur, aber
gegen die PlentyMarkets/PlentyONE REST API ("Plenty API") statt gegen Odoo.

## Voraussetzungen

* Ein Plenty-Backend-Benutzer (Benutzername/Passwort, kein API-Key)
* `curl` >= 8.x
* `jq` (wird fuer Token-Extraktion und JSON-Verarbeitung in praktisch jedem
  Skript benoetigt)

`../config.sh` muss zusaetzlich zu den ODOO_*-Variablen setzen:

```bash
export PLENTY_URL="https://p12345.my.plentysystems.com"
export PLENTY_USERNAME="dein-backend-benutzer"
export PLENTY_PASSWORD="dein-passwort"
```

## Ausführung

Wie bei `../odoo`: aus diesem Verzeichnis heraus ausführen, da die Skripte
`../config.sh` und `./_login.sh` relativ zum aktuellen Arbeitsverzeichnis laden.

```bash
cd plenty
./A005-search_read.sh
```

`_login.sh` wird von (fast) jedem Testskript per `source` eingebunden. Es
tauscht `PLENTY_USERNAME`/`PLENTY_PASSWORD` gegen einen Bearer-Token
(`POST /rest/login`) und exportiert ihn als `PLENTY_ACCESS_TOKEN` - anders als
bei Odoo gibt es keinen statischen API-Key.

## Warum nicht alle odoo/-Skripte eine Entsprechung haben

Die Serien **H (RabbitMQ)**, **I (Checkmk)** und **J (Prometheus)** aus
`../odoo` testen die Infrastruktur *hinter* einer selbstgehosteten
Odoo-Installation (Message-Queue, Monitoring, Metriken), nicht die
Odoo-Business-API selbst. Plenty ist ein SaaS-Produkt - Kunden haben keinen
Zugriff auf eine vergleichbare Backend-Infrastruktur des Anbieters. Fuer diese
drei Serien wurden daher bewusst **keine** Plenty-Gegenstuecke erstellt, um
keine nicht existierenden Endpunkte zu erfinden.

Alle Serien **A-G** (Kernmechanik, Kontakte, Artikel, Verkauf, Einkauf, Lager,
Buchhaltung) haben ein 1:1 benanntes Gegenstueck in diesem Ordner - auch dort,
wo die Plenty-API kein echtes Aequivalent bietet. In diesen Faellen enthaelt
das Skript einen `GAP:`-Hinweis statt eines API-Aufrufs (v.a. in der
Buchhaltungs-Serie G, da Plenty kein Hauptbuch/Journal-Konzept besitzt).

## Migrationshinweise

Jedes Skript, das ein strukturelles oder semantisches Abweichen von seinem
Odoo-Pendant zeigt, enthaelt im Kommentarkopf einen Abschnitt
`Migrationshinweis:`. Diese Hinweise sind die Rohdaten fuer das geplante
Migrationstool - siehe [`../MIGRATION_NOTES.md`](../MIGRATION_NOTES.md) fuer
die verdichtete, themensortierte Zusammenfassung.

## Geprüfte Annahmen

Die Skripte in diesem Ordner wurden überprüft. Wo das offizielle
OpenAPI-Schema von der Realität abwich (z.B. `/rest/reorders`,
`/rest/warehouses`, das GET auf `.../documents/invoice`), wurde auf den
tatsächlich funktionierenden Endpunkt korrigiert - siehe die jeweiligen
Migrationshinweis-Kommentare.
