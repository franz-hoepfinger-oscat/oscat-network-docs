<!--
  Copyright (c) 2026 Hans Mühlbauer, Franz Höpfinger and others.

  This program and the accompanying materials are made available under the
  terms of the Eclipse Public License 2.0 which is available at
  https://www.eclipse.org/legal/epl-2.0

  SPDX-License-Identifier: EPL-2.0
-->

## NET_VAR_X8

| | |
|:---|:---|
| **Type	Funktionsbaustein** |  |
| **IN_OUT	X** | NET_VAR_DATA (NET_VAR Datenstruktur) |
| **INPUT	IN_REAL1** | REAL (Eingangwert) |
| **IN_REAL2** | REAL (Eingangwert) |
| **IN_DINT1** | DINT (Eingangwert) |
| **IN_DINT2** | DINT (Eingangwert) |
| **IN_UDINT1** | DINT (Eingangwert) |
| **IN_UDINT2** | DINT (Eingangwert) |
| **IN_DWORD1** | DINT (Eingangwert) |
| **IN_DWORD2** | DINT (Eingangwert) |
| **OUTPUT	OUT_REAL1** | REAL (Ausgangwert) |
| **OUT_REAL2** | REAL (Ausgangwert) |
| **OUT_DINT1** | DINT (Ausgangwert) |
| **OUT_DINT2** | DINT (Ausgangwert) |
| **OUT_UDINT1** | DINT (Ausgangwert) |
| **OUT_UDINT2** | DINT (Ausgangwert) |
| **OUT_DWORD1** | DINT (Ausgangwert) |
| **OUT_DWORD2** | DINT (Ausgangwert) |
| **ID** | BYTE (Identifikationsnummer) |
| | Der Baustein NET_VAR_X8 dient zum bidirektionalen Übertragen von je zwei REAL,DINT,UDINT,DWORD Werten vom Master zum Slave und umgekehrt. Die Eingangswerte werden erfasst und an der anderen Seite (Steuerung) am gleichen Baustein an der gleichen Position wieder ausgegeben. |
| | Gleichzeitig werden die an der Gegenseite (andere Steuerung) übergebenen Eingangswerte hier wieder ausgegeben. |
| | Parameter ID zeigt die aktuelle Identifikationsnummer der Bausteininstanz. Ist die Konfiguration des Master und des Slave Programmes unterschiedlich (fehlerhaft) wird diese ID-Nummer als Fehlerort beim Baustein NET_VAR_CONTROL ausgegeben. |

![net_var_x8](net_var_x8.gif)
