<!--
  Copyright (c) 2026 Hans Mühlbauer, Franz Höpfinger and others.

  This program and the accompanying materials are made available under the
  terms of the Eclipse Public License 2.0 which is available at
  https://www.eclipse.org/legal/epl-2.0

  SPDX-License-Identifier: EPL-2.0
-->

## NET_VAR_BUFFER

| | |
|:---|:---|
| **Type	Funktionsbaustein** |  |
| **IN_OUT	X** | NET_VAR_DATA (NET_VAR Datenstruktur) |
| **BUF_IN** | ARRAY[1..64] OF BYTE (Eingang-Datenpuffer) |
| **BUF_OUT** | ARRAY[1..64] OF BYTE (Ausgang-Datenpuffer) |
| **OUTPUT	ID** | BYTE (Identifikationsnummer) |
| | Der Baustein NET_VAR_BUFFER dient zum bidirektionalen Übertragen von 64 Bytes vom Master zum Slave und umgekehrt. Die Daten von BUF_IN werden erfasst und an der anderen Seite (andere Steuerung) am gleichen Baustein an der gleichen Position als BUF_OUT wieder ausgegeben. |
| | Gleichzeitig werden die an der Gegenseite (andere Steuerung) übergebenen Eingangsdaten hier als BUF_OUT wieder ausgegeben. |
| | Parameter ID zeigt die aktuelle Identifikationsnummer der Bausteininstanz. Ist die Konfiguration des Master und des Slave Programmes unterschiedlich (fehlerhaft) wird diese ID-Nummer als Fehlerort beim Baustein NET_VAR_CONTROL ausgegeben. |

![net_var_buffer](net_var_buffer.gif)
