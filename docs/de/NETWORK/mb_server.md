<!--
  Copyright (c) 2026 Hans Mühlbauer, Franz Höpfinger and others.

  This program and the accompanying materials are made available under the
  terms of the Eclipse Public License 2.0 which is available at
  https://www.eclipse.org/legal/epl-2.0

  SPDX-License-Identifier: EPL-2.0
-->

## MB_SERVER (OPEN-MODBUS)

| | |
|:---|:---|
| **Type	Funktionsbaustein** |  |
| **IN_OUT	IP_C** | IP_C (Parametrierungsdaten) |
| **S_BUF** | NETWORK_BUFFER_SHORT (Sendedaten) |
| **R_BUF** | NETWORK_BUFFER_SHORT (Empfangsdaten) |
| **VMAP** | ARRAY [1..10] OF VMAP_DATA (Virtuelle Adresstabellen) |
| **DATA** | ARRAY [0..255] OF WORD (MODBUS-Register) |
| **INPUT	DATA_SIZE** | INT (Anzahl der Datenwörter in DATA) |
| **ENABLE** | BOOL (Freigabe) |
| **UDP** | BOOL  (Vorwahl TCP / UDP, TRUE = UDP) |
| **OUTPUT	ERROR** | DWORD (Fehlercode) |
| | Der Baustein ermöglicht den Zugriff von Extern auf lokale MODBUS-Datentabellen über Ethernet . Es werden Kommandos der Klassen 0,1,2 unterstützt. Die Parameter IP_C, S_BUF, R_BUF bilden hierbei die Schnittstelle zum IP_CONTROL Baustein der hier zur Abwicklung bzw. Koordinierung benutzt wird. Die gewünschte  Port-Nummer (Standard für MODBUS ist 502) muss am IP_CONTROL zentral angegeben werden. Die IP-Adresse wird am IP_CONTROL nicht benötigt, da dieser hier im Modus PASSIV agiert. Die DATA-Struktur ist als WORD-Array ausgeführt und beinhaltet die MODBUS-Daten. Mittels DATA_SIZE wird die Größe von  DATA angegeben. Durch ENABLE wird der Baustein freigegeben, und bei Wegnahme der Freigabe wird eine eventuell aktive Abfrage noch beendet. Bei Geräten die MODBUS-UDP unterstützen kann mittels UDP=TRUE dieser Modus aktiviert werden. Eine negative Befehlsausführung wird mittels ERROR gemeldet (Siehe ERROR-Tabelle). |
| | Mittels Einträgen in der Datenstruktur VMAP können virtuelle Datenbereiche angelegt werden, und der Zugriff für bestimmte Funktionscodes und Datenbereiche parametriert werden. Somit ist es sehr einfach möglich virtuelle Adressbereiche in einen zusammenhängenden Datenblock (DATA) abzubilden, oder Datenbereiche mit einen Schreibschutz zu versehen, oder Bereiche die mit Ausgangsperipherie gekoppelt sind mit einer Watchdog zu versehen. |
| | Die Handhabung der VMAP-Daten ist beim Baustein MB_VMAP näher beschrieben. |
| **ERROR** |  |
| **Unterstützte Funktionscodes und verwendete Parameter** |  |

![mb_server](mb_server.gif)

| Wert | Ursprung | Beschreibung |
| --- | --- | --- |
| B3 | B2 | B1 | B0 |  |  |
| nn | nn | nn | xx | IP_CONTROL | Fehler vom Baustein IP_CONTROL |
| xx | xx | xx | 00 | MB_SERVER | NO ERROR: |
| xx | xx | xx | 01 | MB_SERVER | ILLEGAL FUNCTION: |
| xx | xx | xx | 02 | MB_SERVER | ILLEGAL DATA ADDRESS: |
| xx | xx | xx | 03 | MB_SERVER | ILLEGAL DATA VALUE: |

| Funktionscode | Bit Zugriff | 16 Bit Zugriff (Register) | Gruppe | Funktion Beschreibung |
| --- | --- | --- | --- | --- |
| 1 | x |  | Coils | Read Coils |
| 2 | x |  | Input Discrete | Read Discrete Inputs |
| 3 |  | x | Holding Register | Read Holding Registers |
| 4 |  | x | Input Register | Read Input Register |
| 5 | x |  | Coils | Write Single Coil |
| 6 |  | x | Holding Register | Write Single Register |
| 15 | x |  | Coils | Write Multiple Coils |
| 16 |  | x | Holding Register | Write Multiple Register |
| 22 |  | x | Holding Register | Mask Write Register |
| 23 |  | x | Holding Register | Read/Write Multiple Register |
