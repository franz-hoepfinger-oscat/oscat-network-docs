<!--
  Copyright (c) 2026 Hans Mühlbauer, Franz Höpfinger and others.

  This program and the accompanying materials are made available under the
  terms of the Eclipse Public License 2.0 which is available at
  https://www.eclipse.org/legal/epl-2.0

  SPDX-License-Identifier: EPL-2.0
-->

## TN_RECEIVE

| | | |
|:---|:---|:---|
| **Type** | Funktionsbaustein | |
| **IN_OUT	Xus_TN_SCREEN** | us_TN_SCREEN | |
| **R_BUF** | NETWORK_BUFFER | (Telnet Empfangsbuffer) |
| | Der Baustein TN_RECEIVE empfängt die Eingabedaten vom Telnet-Client und wertet die Tastencodes aus. | |
| | Liegt der Tastencode im Bereich 32-126 so wird dieser als ASCII-Code unter Xus_TN_SCREEN.by_Input_ASCII_Code abgelegt. Zusätzlich wird Xus_TN_SCREEN.bo_Input_ASCII_IsNum = TRUE wenn dieser eine Ziffer zwischen 0 und 9 entspricht. | |
| | Ist der Tastencode einer der folgenden Extended-Codes dann wird dieser unter Xus_TN_SCREEN.by_Input_Exten_Code abgelegt. | |

![tn_receive](tn_receive.gif)

| Exten_code | Tastenbezeichnung |
| --- | --- |
| 65 | Cursor oben |
| 66 | Cursor unten |
| 67 | Cursor rechts |
| 68 | Cursor links |
| 72 | Pos1 |
| 75 | Ende |
| 80 | F1 |
| 81 | F2 |
| 82 | F3 |
| 83 | F4 |
| 8 | Backspace |
| 9 | Tabulator |
| 13 | Return (Enter) |
| 27 | Escape |
