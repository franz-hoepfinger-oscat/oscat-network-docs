<!--
  Copyright (c) 2026 Hans Mühlbauer, Franz Höpfinger and others.

  This program and the accompanying materials are made available under the
  terms of the Eclipse Public License 2.0 which is available at
  https://www.eclipse.org/legal/epl-2.0

  SPDX-License-Identifier: EPL-2.0
-->

## LOG_MSG

| | |
|:---|:---|
| **Type	Funktionsbaustein** |  |
| **IN_OUT	LOG_CL** | LOG_CONTROL (LOG-Daten) |
| | Mit LOG_MSG können Meldungen (STRINGS) in einen RING-BUFFER abgelegt werden. Die Meldungen können mit Zusatzparameter versehen werden wie Frontcolor und Backcolor für die Ausgabe auf TELNET sowie ein Eintragsfilter durch vorgabe eines Nachrichten-Level. Ist der Level der Nachricht grösser als der Vorgabe-Log-Level , so wird diese Nachricht verworfen. Weiters kann mit Enable auch das Logging allgemein deaktiviert werden. Somit ist es kein Problem viele Meldungen pro SPS-Zyklus zu archivieren. Der Nachrichtenbuffer kann z.B. mit dem Baustein TELNET_LOG auf einen TELNET-CLIENT ausgegeben werden. Details zur Schnittstelle sind in der nachfolgenden Tabelle ersichtlich. |
| | Wenn aus verschiedenen Bausteininstanzen Meldungen in den selben LOG_BUFFER eingetragen werden sollen, so muss die „LOG_CL“ Datenstruktur GLOBAL angelegt werden. |

![log_msg](log_msg.gif)
