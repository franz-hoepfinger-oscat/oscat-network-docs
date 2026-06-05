<!--
  Copyright (c) 2026 Hans Mühlbauer, Franz Höpfinger and others.

  This program and the accompanying materials are made available under the
  terms of the Eclipse Public License 2.0 which is available at
  https://www.eclipse.org/legal/epl-2.0

  SPDX-License-Identifier: EPL-2.0
-->

## MOON_PHASE

| | |
|:---|:---|
| **Type	Funktionsbaustein** |  |
| **INPUT	XDT** | DT (Datum / Uhrzeit) |
| **SCALE** | BYTE (Skalierungsfaktor) |
| **UPDATE** | TIME (Aktualisierungszeit) |
| **OUTPUT	PHASE** | BYTE (Skalierte Wert der Mondphase) |
| | Der Baustein MOON_PHASE dient berechnen der Mondphase zum angegeben Datum. Am Parameter XDT wird das aktuelle Datum und die Zeit übergeben, und immer nach Ablauf der Zeit bei Parameter „UPDATE“ neu berechnet. Der Standardwert für UPDATE ist 1 Stunde, und für den Skalierungsfaktor 12. |
| | Eine Mondphase dauert ca. 29.53 Tage, und durchläuft hierbei die typischen Zustände von Neumond bis Vollmond bzw. zunehmender und abnehmender Mond). Dieser Zyklus kann mittels SCALE auf einen gewünschten Wert zwischen 0 und 255 skaliert werden. Wird hier z.B, 100 angegeben, so wird die Mondphase als Prozentwert ausgegeben. |
| | Die tatsächliche Länge einer einzelnen Mond-Periode, ist verhältnismäßig großen Schwankungen unterworfen, und wird von der verwendeten Berechnungsmethode nicht berücksichtigt. Somit ergeben sich mitunter Abweichungen von einigen Stunden. Auch der Betrachtungsort (Geo-Position) ist ein virtueller Punkt im Erdmittelpunkt. |
| | Soll die Mondphase mittels Grafik visualisiert werden kann der Stand-Skalierungsfaktor von 12 benutzt werden, um damit die Stufen 0-11 zu erhalten |
| | Siehe Kapitel Visualisierung - Mond-Grafiken |
| **http** | //de.wikipedia.org/wiki/Mondphase |

![moon_phase](moon_phase.gif)
