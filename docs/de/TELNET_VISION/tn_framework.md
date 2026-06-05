<!--
  Copyright (c) 2026 Hans Mühlbauer, Franz Höpfinger and others.

  This program and the accompanying materials are made available under the
  terms of the Eclipse Public License 2.0 which is available at
  https://www.eclipse.org/legal/epl-2.0

  SPDX-License-Identifier: EPL-2.0
-->

## TN_FRAMEWORK

| | |
|:---|:---|
| **Type** | Funktionsbaustein |
| **IN	PORT** | WORD (optionale PORT-Nummer) |
| **IN_OUT	Xus_TN_INPUT_CONTROL** | us_TN_INPUT_CONTROL |
| **Xus_TN_SCREEN** | us_TN_SCREEN |
| **Xus_TN_MENU** | us_TN_MENU |
| **S_BUF** | NETWORK_BUFFER (Sendedaten) |
| **R_BUF** | NETWORK_BUFFER (Empfangsdaten) |
| **IP_C** | IP_CONTROL (Parametrierungsdaten) |
| | Der Baustein TN_FRAMEWORK ist eine Rahmenstruktur die ein fertiges Laufzeitmodell für TELNET-Vision zur Verfügung stellt. |
| | Der Parameter PORT ermöglicht die optionale Vorgabe der PORT Nummer. Wird der Parameter nicht vorgegeben, so wird der Standard Port 23 benutzt. Alle anderen Parameter sind reine Datenstrukturen die für die interne Funktion des Framework notwendig sind. |
| | Folgende Aufgaben und Funktionen werden abgehandelt. |
| | Verbindungsaufbau und Abbau mit Telnet-Client |
| | Daten senden und Empfangen |
| | Datenstrukturen für grafische Funktionen |
| | Datenstrukturen für INPUT_CONTROL Elemente |
| | Automatisches Intelligentes Updaten des Telnet-Anzeige |
| | Menu-Bar Darstellung |
| | Direkter Zugang zu allen Datenstrukturen für Anwenderprogramm |

![tn_framework](tn_framework.gif)
