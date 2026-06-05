<!--
  Copyright (c) 2026 Hans Mühlbauer, Franz Höpfinger and others.

  This program and the accompanying materials are made available under the
  terms of the Eclipse Public License 2.0 which is available at
  https://www.eclipse.org/legal/epl-2.0

  SPDX-License-Identifier: EPL-2.0
-->

## NET_VAR_CONTROL

| | |
|:---|:---|
| **Type	Funktionsbaustein** |  |
| **IN_OUT	X** | NET_VAR_DATA (NET_VAR Datenstruktur) |
| **INPUT	ACTIVATE** | BOOL (Aktiviert den Datenaustausch) |
| **MASTER** | BOOL (FALSE=SLAVE / TRUE = MASTER) |
| **UDP** | BOOL (FALSE=TCP / TRUE = UDP) |
| **REMOTE_IP4** | DWORD (IP4-Adresse der anderen SPS) |
| **REMOTE_PORT** | WORD (PORT-Nummer der anderen SPS) |
| **SCAN_TIME** | TIME (Aktualisierungszeit) |
| **WATCHDOG** | TIME (Überwachungszeit) |
| **OUTPUT	RUN** | BOOL (Datenaustausch aktiv – kein Fehler) |
| **ERROR** | DWORD ((Fehlercode) |
| | Der Baustein NET_VAR_CONTROL koordiniert den Datenaustausch zwischen den beiden Steuerungen und den Satellitenbausteinen NET_VAR_*. Mit ACTIVATE = TRUE kann der Datenaustausch freigegeben werden. Der Baustein muss auf beiden Steuerungen aufgerufen werden, wobei der Parameter MASTER einmal mit TRUE und einmal mit FALSE belegt werden muss. Damit wird bestimmt welche Seite den aktiven Verbindungsaufbau vornimmt. Mit UDP (FALSE/TRUE) kann vorgeben werden, ob eine UDP oder TCP-Verbindung benutzt wird. Die IP-Adresse der Gegenseite muss bei REMOTE-IP4 vorgeben werden, und alternativ auch die Port-Adresse (Standard-Port ist 10000). Die SCAN-TIME bestimmt in welchen Zeitabstand eine Datenaktualisierung durchgeführt wird (Standardwert ist T#1s). Über WATCHDOG wird die Überwachungszeit vorgegeben (Standardwert ist T#2s).Bei funktionierenden Datenaustausch wird Parameter RUN = TRUE. Ist der Datenaustausch länger als die Watchdog Zeit nicht möglich , wird RUN = FALSE und ein Fehler ausgegeben. Der Fehler muss nicht quittiert werden, da der Baustein selbstständig versucht den Datenaustausch wiederherzustellen. Sobald kein Fehler mehr vorhanden ist, wird RUN = TRUE und der Fehlercode wird wieder gelöscht. |
| **ERROR** | (als HEX-Wert betrachten !) |

![net_var_control](net_var_control.gif)

| DWORD | Meldungstype | Beschreibung |
| --- | --- | --- |
| B3 | B2 | B1 | B0 |  |  |
| XX | .. | .. | .. | Verbindungsaufbau | Connect-Error - Siehe Baustein IP_CONTROL |
| .. | XX | .. | .. | Daten senden | Sende-Error  - Siehe Baustein IP_CONTROL |
| .. | .. | XX | .. | Daten empfangen | Empfangs-Error  - Siehe Baustein IP_CONTROL |
| .. | .. | .. | XX | Konfigurationsfehler | ID-Nummer des Baustein |
