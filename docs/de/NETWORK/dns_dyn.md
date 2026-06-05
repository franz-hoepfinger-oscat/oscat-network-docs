<!--
  Copyright (c) 2026 Hans Mühlbauer, Franz Höpfinger and others.

  This program and the accompanying materials are made available under the
  terms of the Eclipse Public License 2.0 which is available at
  https://www.eclipse.org/legal/epl-2.0

  SPDX-License-Identifier: EPL-2.0
-->

## DNS_DYN

| | |
|:---|:---|
| **Type** | Funktionsbaustein |
| **INPUT	ENABLE** | BOOL (Freigabe des Bausteins) |
| **UPDATE** | BOOL (Startet neue DNS-Registrierung sofort) |
| **T_UPDATE** | TIME (Wartezeit für neue DNS-Registrierung) |
| **MODE** | BYTE (Auswahl des DynDNS-Providers) |
| **HOSTNAME** | STRING(30) (eigener Domain-Name) |
| **USERNAME** | STRING(20) (Name für Registrierung) |
| **PASSWORD** | STRING(20) (Passwort für Registrierung) |
| **IP4** | DWORD (Optionale Angabe der IP-Adresse) |
| **OUTPUT	BUSY** | BOOL (Baustein ist aktiv, Abfrage wird durchgeführt) |
| **DONE** | BOOL (DNS-Registrierung erfolgreich durchgeführt) |
| **ERROR_C** | DWORD (Fehlercode) |
| **ERROR_T** | BYTE (Fehlertype) |
| **IN_OUT	IP_C** | IP_C (Parametrierungsdaten) |
| **S_BUF** | NETWORK_BUFFER (Sendedaten) |
| **R_BUF** | NETWORK_BUFFER (Empfangsdaten) |
| | Mittels DNS_DYN können dynamische IP-Adressen als Domain-Name registriert werden. Bei vielen Internet-Providern wird bei Einwahl ins Internet eine dynamische IP-Adresse vergeben. Um von anderen Internet-Teilnehmern trotzdem auffindbar und erreichbar zu sein, ist eine der Möglichkeiten, das man seine aktuelle IP-Adresse mittels Dyn-DNS immer aktualisiert. Das Verfahren ist leider nicht standardisiert, somit ist für jeden Dyn-DNS Provider ein spezielle Lösung zu erstellen. Der Baustein kann in Verbindung mit DynDNS.org und Selfhost.de eingesetzt werden. Diese Provider bieten neben kostenpflichtigen auch kostenlose Dyn-DNS Dienste an. |
| | Wird ENABLE auf TRUE gesetzt, dann wird der Baustein aktiv. Mittels einer  positiven Flanke auf UPDATE kann jederzeit eine Aktualisierung gestartet werden. Wenn bei T_UPDATE eine Zeit angegeben ist, so wird immer nach Ablauf dieser Zeit auch eine Aktualisierung durchgeführt. |
| | Achtung , die meisten DynDNS Provider bewerten eine zu häufiges bzw. unnötiges Updaten als Angriff, und blockieren eventuell den Account für eine gewisse Zeit. |
| | Die Zeit T_UPDATE sollte nicht unter einer Stunde eingestellt sein. Wird der Parameter T_UPDATE nicht beschalten so wird als Updatezeit 1 Stunde angenommen. Wird kein Updaten über Zeit benötigt, dann sollte T#0ms übergeben werden. |
| | Der Parameter MODE ermöglicht die Auswahl der DynDNS-Providers |
| | (0 = DynDNS.org , 1 = SELFHOST.DE) |
| | Der eigene Domainname muss bei HOSTNAME übergeben werden. Zur Sicherheit muss man beim DynDNS-Provider mittels USERNAME und PASSWORD die Authorisierungs-Daten angeben. Wird der Parameter IP4 nicht belegt, so wird vom DynDNS Provider automatisch die aktuelle WAN-IP mit der die Aktualisierung durchgeführt wird, als aktuelle Registrierung-IP angenommen. Durch Angabe von eine IP-Adresse kann aber auch eine individuelle IP-Adresse angegeben werden. |
| | Bei fehlerfreier Durchführung wird DONE = TRUE , ansonsten wird an ERROR_C und ERROR_T der Fehlercode und der Fehlertype ausgegeben.(Siehe Fehlercodes). |
| **ERROR_T** |  |

![dns_dyn.GIF](dns_dyn.GIF)

| Wert | Eigenschaften |
| --- | --- |
| 1 | Die genaue Bedeutung von ERROR_C ist beim Baustein DNS_CLIENT nachzulesen |
| 2 | Die genaue Bedeutung von ERROR_C ist beim Baustein HTTP_GET nachzulesen |
| 3 | Der DynDNS Provider hat die Registrierung abgelehnt |
