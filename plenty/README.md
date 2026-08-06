# Plenty REST API Reference Tests

Gegenstück zu [`../odoo`](../odoo) - dieselben Test-IDs, dieselbe Struktur, aber
gegen die PlentyMarkets/PlentyONE REST API ("Plenty API") statt gegen Odoo.

## Voraussetzungen

* Ein Plenty-Backend-Benutzer (Benutzername/Passwort, kein API-Key)
* `curl` >= 8.x
* `jq` (wird für Token-Extraktion und JSON-Verarbeitung in praktisch jedem
  Skript benötigt)

`../config.sh` muss zusätzlich zu den ODOO_*-Variablen setzen:

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
Zugriff auf eine vergleichbare Backend-Infrastruktur des Anbieters. Für diese
drei Serien wurden daher bewusst **keine** Plenty-Gegenstücke erstellt, um
keine nicht existierenden Endpunkte zu erfinden.

Alle Serien **A-G** (Kernmechanik, Kontakte, Artikel, Verkauf, Einkauf, Lager,
Buchhaltung) haben ein 1:1 benanntes Gegenstück in diesem Ordner - auch dort,
wo die Plenty-API kein echtes Äquivalent bietet. In diesen Fällen enthält
das Skript einen `GAP:`-Hinweis statt eines API-Aufrufs (v.a. in der
Buchhaltungs-Serie G, da Plenty kein Hauptbuch/Journal-Konzept besitzt).

## Migrationshinweise

Jedes Skript, das ein strukturelles oder semantisches Abweichen von seinem
Odoo-Pendant zeigt, enthält im Kommentarkopf einen Abschnitt
`Migrationshinweis:`. Diese Hinweise sind die Rohdaten für das geplante
Migrationstool - siehe [`../MIGRATION_NOTES.md`](../MIGRATION_NOTES.md) für
die verdichtete, themensortierte Zusammenfassung.

## Geprüfte Annahmen

Die Skripte in diesem Ordner wurden überprüft. Wo das offizielle
OpenAPI-Schema von der Realität abwich (z.B. `/rest/reorders`,
`/rest/warehouses`, das GET auf `.../documents/invoice`), wurde auf den
tatsächlich funktionierenden Endpunkt korrigiert - siehe die jeweiligen
Migrationshinweis-Kommentare.

Zusätzlich wurde jeder `/rest/`-Aufruf dieses Ordners systematisch gegen das
offizielle plentymarkets-OpenAPI-v3-Schema abgeglichen (Pfad, HTTP-Methode und
Query-Parameter gegen alle 1199 dokumentierten Pfade). Dabei korrigiert:
Wareneingänge hängen an `OrderItemTransaction`, nicht an `OrderItem` (E016);
Steuersätze liegen in `VatRate`, nicht im `Vat`-Datensatz (G020); sowie
`itemsPerPage` auf drei Endpunkten, die laut Schema nicht paginiert sind
(F018/F019/G016).

## Review

Die Skripte in diesem Ordner wurden durchgesehen von
[**Lukas Ehrenberg**](https://www.hqgmbh.de/autoren/lukas-ehrenberg/),
Senior Shopware Developer & Cluster-Spezialist der
[HQ GmbH](https://www.hqgmbh.de/)
(siehe `Reviewed by:` im Kommentarkopf jedes Skripts).
