<!--
  Copyright (c) 2026 Hans Mühlbauer, Franz Höpfinger and others.

  This program and the accompanying materials are made available under the
  terms of the Eclipse Public License 2.0 which is available at
  https://www.eclipse.org/legal/epl-2.0

  SPDX-License-Identifier: EPL-2.0
-->

## TN_SC_ADD_SHADOW

| | |
|:---|:---|
| **Type** | Funktionsbaustein |
| **INPUT** | Iin_Y1 : INT : (Y1-Koordinate der Fläche) |
| **Iin_X1** | INT : (X1-Koordinate der Fläche) |
| **Iin_Y2** | INT : (Y2-Koordinate der Fläche) |
| **Iin_X2** | INT : (X2-Koordinate der Fläche) |
| **Iin_OPTION** | INT : (Art des Schattens) |
| **IN_OUT	Xus_TN_SCREEN** | us_TN_SCREEN |
| | Der Baustein TN_SC_ADD_SHADOW ermöglicht das hinzufügen von optischen Schatten zu Rechteckigen Zeichenelementen. Durch Angabe einer rechteckigen Fläche mittels der Parameter X1,Y1 und X2,Y2 wird der Grundrahmen definiert, zu dem rechts und unten farblich abgedunkelter Linien gezeichnet werden. Die Schattenkoordinaten X1,Y1 und X2,Y2 werden immer +1 zum eigentlichen Grundelement angegeben. Mittels OPTION kann zwischen zwei Schattenvarianten gewählt werden. Wenn OPITION = 0 dann wird der Schatten durch reine Farbanpassung (Abdunkelung der Zeichen) erreicht. Wird eine OPTION > 0 angegeben, werden im Bereich des Schattens alle Zeichen durch schwarze ausgefüllte Zeichen ersetzt. |

![TN_SC_ADD_SHADOW](TN_SC_ADD_SHADOW.gif)
