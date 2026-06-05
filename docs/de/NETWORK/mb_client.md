<!--
  Copyright (c) 2026 Hans Mühlbauer, Franz Höpfinger and others.

  This program and the accompanying materials are made available under the
  terms of the Eclipse Public License 2.0 which is available at
  https://www.eclipse.org/legal/epl-2.0

  SPDX-License-Identifier: EPL-2.0
-->

## MB_CLIENT (OPEN-MODBUS)

| | |
|:---|:---|
| **Type	Funktionsbaustein** |  |
| **IN_OUT	IP_C** | IP_C (Parametrierungsdaten) |
| **S_BUF** | NETWORK_BUFFER_SHORT (Sendedaten) |
| **R_BUF** | NETWORK_BUFFER_SHORT (Empfangsdaten) |
| **DATA** | ARRAY [0..255] OF WORD (MODBUS-Register) |
| **INPUT	DATA_SIZE** | INT (Anzahl der Datenwörter in Struktur MB_DATA) |
| **ENABLE** | BOOL (Freigabe) |
| **UDP** | BOOL  (Vorwahl TCP / UDP, TRUE = UDP) |
| **FC** | INT (Funktionsnummer) |
| **UNIT_ID** | BYTE (Geräte-Identifikationsnummer) |
| **R_ADDR** | INT (Lesebefehl: MODBUS Datenpunkt Adresse) |
| **R_POINTS** | INT (Lesebefehl: MODBUS Anzahl der Datenpunkte) |
| **R_DATA_ADR** | INT (Lesebefehl: DATA Datenpunkt Adresse) |
| **R_DATA_BITPOS** | INT (Lesebefehl: DATA Datenpunkt Bitpos.) |
| **W_ADDR** | INT (Lesebefehl: MODBUS Datenpunkt Adresse) |
| **W_POINTS** | INT (Lesebefehl: MODBUS Anzahl der Datenpunkte) |
| **W_DATA_ADR** | INT (Lesebefehl: DATA Datenpunkt Adresse) |
| **W_DATA_BITPOS** | INT (Lesebefehl: DATA Datenpunkt Bitpos.) |
| **DELAY** | TIME (Wiederholungszeit) |
| **OUTPUT	ERROR** | DWORD (Fehlercode) |
| **BUSY** | BOOL (Baustein ist aktiv) |
| | Der Baustein ermöglicht den Zugriff auf Ethernet-Geräte die MODBUS-TCP bzw. MODBUS-UDP unterstützten, bzw. MODBUS RS232/485 Geräte die über Ethernet-Modbus-Gateway angebunden sind. Es werden Kommandos aus  den Klassen 0,1,2 unterstützt. Die Parameter IP_C, S_BUF, R_BUF bilden hierbei die Schnittstelle zum IP_CONTROL Baustein der hier zur Abwicklung bzw. Koordinierung benutzt wird. Die gewünschte  IP-Adresse und Port-Nummer (Standard für MODBUS ist 502) muss am IP_CONTROL zentral angegeben werden. Die DATA-Struktur ist als WORD-Array ausgeführt und beinhaltet die MODBUS-Daten für Lesen und Schreiben. Mittels DATA_SIZE wird die Größe des WORD_ARRAY angegeben. Durch ENABLE wird der Baustein freigegeben, und bei Wegnahme der Freigabe wird eine eventuell aktive Abfrage noch beendet. Bei Geräten die MODBUS-UDP unterstützen kann mittels UDP=TRUE dieser Modus aktiviert werden. Der Parameter UNIT_ID muss nur bei Nutzung eines Ethernet-Modbus-Gateway angegeben werden. Die gewünschte Funktion wird mittels FC angegeben (Siehe Funktionscode-Tabelle). Je nach Funktion müssen die R_xxx und W_xxx Parameter mit Daten versorgt werden. Durch Angabe DELAY kann die  die Wiederholungszeit vorgegeben werden. Wird keine Zeit angeben so wird versucht so oft wie möglich das Kommando auszuführen. Durch die integrierte Zugriffsverwaltung ist automatisch sichergestellt, das andere Baustein-Instanzen auch an die Reihe kommen. Eine negative Befehlsausführung wird mittels ERROR gemeldet (Siehe ERROR-Tabelle).Wenn der Baustein aktiv eine Abfrage durchführt, dann wird während dieser Zeit BUSY=TRUE ausgegeben. |
| **Unterstützte Funktionscodes und verwendete Parameter** |  |
| **ERROR** |  |

![mb_client](mb_client.gif)

| Funktionscode | Bit Zugriff | 16 Bit Zugriff (Register) | Gruppe | Funktion Beschreibung | R_ADDR | R_POINTS | R_DATA_ADR | R_DATA_BITPOS | W_ADDR | W_POINTS | W_DATA_ADR | W_DATA_BITPOS |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | x |  | Coils | Read Coils | x | x | x | x |  |  |  |  |
| 2 | x |  | Input Discrete | Read Discrete Inputs | x | x | x | x |  |  |  |  |
| 3 |  | x | Holding Register | Read Holding Registers | x | x | x |  |  |  |  |  |
| 4 |  | x | Input Register | Read Input Register | x | x | x |  |  |  |  |  |
| 5 | x |  | Coils | Write Single Coil |  |  |  |  | x |  | x | x |
| 6 |  | x | Holding Register | Write Single Register |  |  |  |  | x |  | x |  |
| 15 | x |  | Coils | Write Multiple Coils |  |  |  |  | x | x | x | x |
| 16 |  | x | Holding Register | Write Multiple Register |  |  |  |  | x | x | x |  |
| 22 |  | x | Holding Register | Mask Write Register |  |  |  |  | x |  | x |  |
| 23 |  | x | Holding Register | Read/Write Multiple Register | x | x | x |  | x | x | x |  |

| Wert | Ursprung | Beschreibung |
| --- | --- | --- |
| B3 | B2 | B1 | B0 |  |  |
| nn | nn | nn | xx | IP_CONTROL | Fehler vom Baustein IP_CONTROL |
| xx | xx | xx | 00 | MB_CLIENT | No Error |
| xx | xx | xx | 01 | MB_CLIENT | ILLEGAL FUNCTION:The function code received in the query is not an allowable action for the server (or slave). This may be because the function code is only applicable to newer devices, and was not implemented in the unit selected. It could also indicate that the server (or slave) is in the wrong state to process a request of this type, for example because it is unconfigured and is being asked to return register values. |
| xx | xx | xx | 02 | MB_CLIENT | ILLEGAL DATA ADDRESS:The data address received in the query is not an allowable address for the server (or slave). More specifically, the combination of reference number and transfer length is invalid. For a controller with 100 registers, the PDU addresses the first register as 0, and the last one as 99. If a request is submitted with a starting register address of 96 and a quantity of registers of 4, then this request will successfully operate (address-wise at least) on registers 96, 97, 98, 99. If a request is submitted with a starting register address of 96 and a quantity of registers of 5, then this request will fail with Exception Code 0x02 “Illegal Data Address” since it attempts to operate on registers 96, 97, 98, 99 and 100, and there is no register with address 100. |
| xx | xx | xx | 03 | MB_CLIENT | ILLEGAL DATA VALUE:A value contained in the query data field is not an allowable value for server (or slave). This indicates a fault in the structure of the remainder of a complex request, such as that the implied length is incorrect. It specifically does NOT mean that a data item submitted for storage in a register has a value outside the expectation of the application program, since the MODBUS protocol is unaware of the significance of any particular value of any particular register. |
| xx | xx | xx | 04 | MB_CLIENT | SLAVE DEVICE FAILURE:An unrecoverable error occurred while the server (or slave) was attempting to perform the requested action. |
| xx | xx | xx | 05 | MB_CLIENT | ACKNOWLEDGE:Specialized use in conjunction with programming commands. The server (or slave) has accepted the request and is processing it, but a long duration of time will be required to do so. This response is returned to prevent a timeout error from occurring in the client (or master). The client (or master) can next issue a Poll Program Complete message to determine if processing is completed. |
| xx | xx | xx | 06 | MB_CLIENT | SLAVE DEVICE BUSY:Specialized use in conjunction with programming commands. The server (or slave) is engaged in processing a long–duration program command. The client (or master) should retransmit the message later when the server (or slave) is free. |
| xx | xx | xx | 8 | MB_CLIENT | MEMORY PARITY ERROR:Specialized use in conjunction with function codes 20 and 21 and reference type 6, to indicate that the extended file area failed to pass a consistency check.The server (or slave) attempted to read record file, but detected a parity error in the memory.The client (or master) can retry the request, but service may be required on the server (or slave) device. |
| xx | xx | xx | 0A | MB_CLIENT | GATEWAY PATH UNAVAILABLE:Specialized use in conjunction with gateways, indicates that the gateway was unable to allocate an internal communication path from the input port to the output port for processing the request. Usually means that the gateway is misconfigured or overloaded. |
| xx | xx | xx | 0B | MB_CLIENT | GATEWAY TARGET DEVICE FAILED TO RESPOND:Specialized use in conjunction with gateways, indicates that no response was obtained from the target device. Usually means that the device is not present on the network. |
