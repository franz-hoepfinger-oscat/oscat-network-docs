<!--
  Copyright (c) 2026 Hans Mühlbauer, Franz Höpfinger and others.

  This program and the accompanying materials are made available under the
  terms of the Eclipse Public License 2.0 which is available at
  https://www.eclipse.org/legal/epl-2.0

  SPDX-License-Identifier: EPL-2.0
-->

## SNTP_SERVER

| | | |
|:---|:---|:---|
| **Type	Funktionsbaustein** |  | |
| **IN_OUT	IP_C** | IP_C (Parametrierungsdaten) | |
| **S_BUF** | NETWORK_BUFFER (Sendedaten) | |
| **R_BUF** | NETWORK_BUFFER (Empfangsdaten) | |
| **INPUT	ENABLE** | BOOL (Startet die SNTP-Server) | |
| **STRATUM** | BYTE (Angabe der hierarchische Ebene bzw. | Genauigkeit) |
| **UDT** | DT (Datums und Zeit Eingang als Weltzeit) | |
| **XMS** | INT (Millisekunden der Weltzeit UDT ) | |
| | Der Baustein stellt die Funktionalität eines SNTP (NTP) Servers zu Verfügung. Bei ENABLE = TRUE meldet sich der Baustein bei IP_CONTROL an und wartet auf Freigabe der Ressource, sollte diese von anderen Teilnehmern momentan noch belegt sein. Danach wartet der Baustein auf Anfragen von anderen SNTP-Clients und beantwortet diese mit der aktuellen Uhrzeit von UDT und XMS. Solange ENABLE = TRUE ist, wird der Zugriff auf diese Ethernet-Ressource dauerhaft für andere Teilnehmer gesperrt (Exklusiv-Zugriff  - wegen Passiv UDP Modus). SNTP nutzt ein hierarchisches System verschiedener Strata. Als Stratum 0 bezeichnet man das exakte Zeitnormal. Die unmittelbar mit ihr gekoppelten Systeme, beispielsweise NTP, GPS oder DCF77 Zeitsignale heißen Stratum 1. Jede weitere abhängige Einheit verursacht einen zusätzlichen Zeitversatz von 10-100ms und erhält bei der Bezeichnung eine höhere Nummer (Stratum 2, Stratum 3 bis 255). Wird kein STRATUM am Baustein angegeben wird STRATUM=1 als Standard verwendet. | |
| | Wenn ein SNTP-Client selber eine Uhrzeit mit höheren Stratum als eine SNTP-Server hat, wird die Uhrzeit von diesen mitunter abgelehnt, da diese ungenauer ist ,als die eigene Referenz. Darum ist es wichtig ein logisch richtiges STRATUM vorzugeben. Der Baustein SNTP_CLIENT ignoriert jedoch absichtlich das STRATUM und synchronisiert sich auf jeden Fall mit dem SNTP-Server, da ziemlich jeder SNTP-Server eine genauere Uhrzeit besitzt , als eine SPS. | |

![sntp_server](sntp_server.gif)
![sntp_server_schema](sntp_server_schema.gif)
