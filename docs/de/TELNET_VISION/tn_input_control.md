<!--
  Copyright (c) 2026 Hans Mühlbauer, Franz Höpfinger and others.

  This program and the accompanying materials are made available under the
  terms of the Eclipse Public License 2.0 which is available at
  https://www.eclipse.org/legal/epl-2.0

  SPDX-License-Identifier: EPL-2.0
-->

## TN_INPUT_CONTROL

| | |
|:---|:---|
| **Type** | Funktionsbaustein |
| **IN_OUT	Xus_TN_SCREEN** | us_TN_SCREEN |
| **Xus_TN_INPUT_CONTROL** | us_TN_INPUT_CONTROL |
| | Der Baustein TN_INPUT_CONTROL dient zum verwalten der INPUT_CONTROL Elemente. Wird Xus_TN_INPUT_CONTROL.bo_Reset_Fokus = TRUE dann wird bei allen Elementen der Fokus deaktiviert und das erste Element bekommt den Fokus zugeteilt. Mit den Tasten Cursor Auf/Ab und Tabulator können die einzelnen Elemente angewählt bzw. gewechselt werden. Das aktuelle Element verliert dabei den Fokus und das nächstfolgende Element bekommt danach den Eingabe-Fokus neu zugeteilt. Bei dem Fokus Wechsel der Elemente wird immer automatisch das neu zeichnen der jeweiligen Elemente ausgelöst. Der Grafik / Blink-Cursor wird dabei immer je aktiven Element positioniert und dargestellt. Dabei wird auch immer automatisch der ToolTip Text ausgegeben und aktualisiert, soweit dieser parametriert wurde. |
| | Es werden folgende Elemente unterstützt. |
| | TN_INPUT_EDIT_LINE |
| | TN_INPUT_SELECT_TEXT |
| | TN_INPUT_SELECT_POPUP |

![tn_input_control](tn_input_control.gif)
