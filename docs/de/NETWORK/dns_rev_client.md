<!--
  Copyright (c) 2026 Hans Mühlbauer, Franz Höpfinger and others.

  This program and the accompanying materials are made available under the
  terms of the Eclipse Public License 2.0 which is available at
  https://www.eclipse.org/legal/epl-2.0

  SPDX-License-Identifier: EPL-2.0
-->

## DNS_REV_CLIENT

| | | |
|:---|:---|:---|
| **Type** | Funktionsbaustein | |
| **IN_OUT	IP_C** | IP_C (Parametrierungsdaten) | |
| **S_BUF** | NETWORK_BUFFER (Sendedaten) | |
| **R_BUF** | NETWORK_BUFFER (Empfangsdaten) | |
| **INPUT	ACTIVATE** | BOOL (Abfrage starten durch positive Flanke) | |
| **DOMAIN** | STRING | (Domain Name oder IP als String) |
| **IP4_DNS** | DWORD (IPv4 Adresse des DNS-Server) | |
| **OUTPUT	IP4** | DWORD (IPv4 Adresse der angefragten Domain) | |
| **DONE** | BOOL (IP der Domain erfolgreich ermittelt) | |
| **ERROR** | DWORD (Fehlercode) | |
| | DNS_REV_CLIENT ermittelt aus den übergebenen IP-Adresse  den offiziell registrierten DOMAIN Namen . Dazu wird eine Reverse DNS-Abfrage über die parametrierte IP-Adresse bei einen DNS-Server gemacht. Bei positiver Flanke von ACTIVATE wird die angegebene IP zwischen gespeichert, so dass diese nicht länger vorhanden sein muss. Sollte die Abfrage mehrere Ergebnisse liefern, so wird immer der letzte Datensatz herangezogen. Als IP4_DNS kann ein beliebiger öffentlicher DNS-Server verwendet werden. Wenn die SPS hinter einen DSL-Router sitzt, kann  dieser über seine Gateway-Adresse dieser als DNS-Server verwendet werden. Was letztendlich auch bei wiederkehrenden Abfragen zu schnelleren Antwortzeiten führt, da diese im Router-Cache verwaltet werden. Bei positiven Ergebnis DONE = TRUE enthält DOMAIN den offiziell registrierten Domain-Namen, bis zum Start der nächsten Abfrage durch positive Flanke von ACTIVATE. ERROR liefert im Fehlerfall die genaue Ursache. (Siehe Fehlercodes). | |
| **Fehlercodes** |  | |

![dns_rev_client.GIF](dns_rev_client.GIF)

| Wert | Ursprung | Beschreibung |
| --- | --- | --- |
| B3 | B2 | B1 | B0 |  |  |
| nn | nn | nn | xx | IP_CONTROL | Fehler vom Baustein IP_CONTROL |
| xx | xx | xx | 00 | DNS_CLIENT | No error: The request completed successfully |
| xx | xx | xx | 01 | DNS_CLIENT | Format error: The name server was unable to interpret the query. |
| xx | xx | xx | 02 | DNS_CLIENT | Server failure: The name server was unable to process this query due to a problem with the name server. |
| xx | xx | xx | 03 | DNS_CLIENT | Name Error: Meaningful only for responses from an authoritative name server, this code signifies that the domain name referenced in the query does not exist |
| xx | xx | xx | 04 | DNS_CLIENT | Not Implemented: The name server does not support the requested kind of query |
| xx | xx | xx | 05 | DNS_CLIENT | Refused: The name server refuses to perform the specified operation for policy reasons |
| xx | xx | xx | 06 | DNS_CLIENT | YXDomain: Name Exists when it should not |
| xx | xx | xx | 07 | DNS_CLIENT | YXRRSet. RR: Set Exists when it should not |
| xx | xx | xx | 08 | DNS_CLIENT | NXRRSet. RR: Set that should exist does not |
| xx | xx | xx | 09 | DNS_CLIENT | Server Not Authoritative for zone |
| xx | xx | xx | 0A | DNS_CLIENT | Name not contained in zone |
