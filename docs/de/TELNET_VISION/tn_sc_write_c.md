<!--
  Copyright (c) 2026 Hans Mühlbauer, Franz Höpfinger and others.

  This program and the accompanying materials are made available under the
  terms of the Eclipse Public License 2.0 which is available at
  https://www.eclipse.org/legal/epl-2.0

  SPDX-License-Identifier: EPL-2.0
-->

## TN_SC_WRITE_C

| | |
|:---|:---|
| **Type** | Funktionsbaustein |
| **INPUT	Iin_Y** | INT (Y-Koordinate) |
| **Iin_X** | INT (X-Koordinate) |
| **Iby_ATTR** | BYTE : (Farbcode) |
| **Ist_STRING** | STRING : (Text) |
| **Iin_LENGTH** | INT : (Text wird auf diese Länge angepasst) |
| **Iin_OPTION** | INT : (Option der Text-Längenanpassung) |
| **IN_OUT	Xus_TN_SCREEN** | us_TN_SCREEN |
| | Der Baustein TN_SC_WRITE_C gibt an der angegebenen Koordinate  Iin_Y, Iin_Y den Text Ist_STRING mit der Farbe Iby_ATTR aus. Der Text wird vor der Ausgabe auf die Länge Iin_LENGTH angepasst, und mittels Iin_OPTION kann die Textposition bestimmt werden. |
| | Iin_OPTION |
| **0 = rechts mit Leerzeichen auffüllen** | z.B.  'TEST  ' |
| **1 = links mit Leerzeichen auffüllen** | z.B. '  TEST' |
| | 2 = zentrieren und mit Leerzeichen auffüllen  z.B. '  TEST  ' |

![tn_sc_write_c](tn_sc_write_c.gif)
