<!--
  Copyright (c) 2026 Hans Mühlbauer, Franz Höpfinger and others.

  This program and the accompanying materials are made available under the
  terms of the Eclipse Public License 2.0 which is available at
  https://www.eclipse.org/legal/epl-2.0

  SPDX-License-Identifier: EPL-2.0
-->

## ELEMENT_COUNT

| | |
|:---|:---|
| **Type	Funktion** | INT |
| **Input	SEP** | BYTE (Separationszeichen der Elemente) |
| **I/O	ELEMENT** | STRING(ELEMENT_LENGTH) (Eingangsliste) |
| **Output** | INT (Anzahl der Elemente in der Liste) |
| | ELEMENT_COUNT ermittelt die Anzahl der Elemente einer Liste. |
| | Ist der Parameter ELEMENT ein leerer String so wird als Ergebnis 0 ausgegeben. Befindet sich mindestens ein Zeichen in ELEMENT wird dies als einzelnes Element bewertet und als ELEMENT_COUNT = 1 ausgegeben. |

![element_count](element_count.gif)

**Beispiel:**

Beispiele:

ELEMENT_COUNT('0,1,2,3',44) = 4

ELEMENT_COUNT('',44) = 0

ELEMENT_COUNT('x',44) = 1
