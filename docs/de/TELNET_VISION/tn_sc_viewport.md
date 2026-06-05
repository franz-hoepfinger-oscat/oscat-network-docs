<!--
  Copyright (c) 2026 Hans Mühlbauer, Franz Höpfinger and others.

  This program and the accompanying materials are made available under the
  terms of the Eclipse Public License 2.0 which is available at
  https://www.eclipse.org/legal/epl-2.0

  SPDX-License-Identifier: EPL-2.0
-->

## TN_SC_VIEWPORT

| | |
|:---|:---|
| **Type** | Funktionsbaustein |
| **INPUT	Iin_Y** | INT : (Y-Koordinate) |
| **Iin_X** | INT : (X-Koordinate) |
| **Iin_Width** | INT : (Breite des Fenster - Anzahl der Zeichen) |
| **Idw_ATTR_1** | DWORD : (Farbe 1,2,3 und 4) |
| **Idw_ATTR_2** | DWORD : (Farbe 5,6,7 und 8) |
| **Iti_TIME** | TIME : (Aktualisierungszeit) |
| **IN_OUT	Xus_LOG_VIEWPORT** | LOG_VIEWPORT |
| **Xus_LOG_CONTROL** | LOG_CONTROL |
| **Xus_TN_SCREEN** | us_TN_SCREEN |
| | Der Baustein TN_SC_VIEWPORT dient zum anzeigen der Meldungen von der Datenstruktur LOG_CONTROL innerhalb eines rechteckigen Bereiches am Bildschirm. Die anzuzeigenden Meldungen werden zuvor mit Hilfe des  Baustein LOG_VIEWPORT aufbereitet, und wenn erforderlich über Xus_LOG_VIEWPORT.UPDATE eine Aktualisierung ausgelöst. Mittels Iin_X und Iin_Y wird die linke obere Ecke des Sichtfenster, und mit Iin_Width die breite des Sichtfensters definiert. Die Anzahl der darzustellenden Zeilen wird durch Xus_LOG_VIEWPORT.COUNT vorgegeben. Die hinterlegte Farbinformation in Xus_LOG_CONTROL.MSG_OPTION[x] pro Meldung wird auf die parametrierten Farbcodes bei Idw_ATTR_1 und Idw_ATTR2 automatisch konvertiert, somit können die Farben bei der Darstellung immer individuell angepasst werden. Die Meldungen werden immer automatisch auf die breite des Sichtfenster gekürzt bzw. Abgeschnitten. |

![tn_sc_viewport](tn_sc_viewport.gif)
