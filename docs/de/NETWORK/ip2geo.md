<!--
  Copyright (c) 2026 Hans Mühlbauer, Franz Höpfinger and others.

  This program and the accompanying materials are made available under the
  terms of the Eclipse Public License 2.0 which is available at
  https://www.eclipse.org/legal/epl-2.0

  SPDX-License-Identifier: EPL-2.0
-->

## IP2GEO

| | |
|:---|:---|
| **Type	Funktionsbaustein** |  |
| **IN_OUT	IP_C** | IP_C (Parametrierungsdaten) |
| **S_BUF** | NETWORK_BUFFER (Sendedaten) |
| **R_BUF** | NETWORK_BUFFER (Empfangsdaten) |
| **GEO** | IP2GEO (Geographische Daten) |
| **INPUT	ACTIVATE** | BOOL (Freigabe zur Abfrage) |
| **OUTPUT	BUSY** | BOOL  (Abfrage ist aktiv) |
| **DONE** | BOOL  (Abfrage ohne Fehler beendet) |
| **ERROR_C** | DWORD  (Fehlercode) |
| **ERROR_T** | BYTE  (Fehlertype) |
| | Der Baustein liefert aufgrund der Wide-Area-Network IP-Adresse die Geographischen Informationen des Internet-Zuganges. Da die WAN-IP-Adressen weltweit registriert sind, lässt sich somit annähernd die Geographische Position der SPS bestimmen. Sollte der Zugang über einen Proxy-Server laufen, so wird die Geographische Position von diesen ermittelt und nicht von der SPS. Normalerweise ist der aber in unmittelbarer Nähe der SPS, und somit die Abweichung nicht relevant. Somit ergeben sich ermittelte Positionen die nur ein paar Kilometer von der wirklichen Position abweichen, und relativ genau sind. |
| | Wird am Parameter „IP“ keine IP-Adresse angegeben, so wird automatisch die aktuelle WAN-IP herangezogen, andernfalls werden die Informationen der parametrierten IP geliefert. Mit einer positiven Flanke von ACTIVATE wird die Abfrage gestartet. Solange die Abfrage nicht beendet ist, wird BUSY=TRUE ausgegeben. Nach erfolgreich beendeter Abfrage wird DONE=TRUE ausgegeben, und bei Parameter WAN_IP wird die aktuelle  WAN-IP Adresse ausgegeben. Sollte bei der Abfrage ein Fehler auftreten so wird dieser unter ERROR_C gemeldet in Kombination mit ERROR_T. |
| **ERROR_T** |  |
| **Der „COUNTRY_CODE ist nach „ISO 3166 Country-Code ALPHA-2“ kodiert. http** | //www.iso.org/iso/english_country_names_and_code_elements http://de.wikipedia.org/wiki/ISO-3166-1-Kodierliste |
| **Der „REGION_CODE“ ist nach „FIPS Region Code“ kodiert.  http** | //en.wikipedia.org/wiki/List_of_FIPS_region_codes |

![ip2geo](ip2geo.gif)

| Wert | Eigenschaften |
| --- | --- |
| 1 | Die genaue Bedeutung von ERROR_C ist beim Baustein DNS_CLIENT nachzulesen |
| 2 | Die genaue Bedeutung von ERROR_C ist beim Baustein HTTP_GET nachzulesen |
