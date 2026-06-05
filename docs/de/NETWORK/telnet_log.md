<!--
  Copyright (c) 2026 Hans Mühlbauer, Franz Höpfinger and others.

  This program and the accompanying materials are made available under the
  terms of the Eclipse Public License 2.0 which is available at
  https://www.eclipse.org/legal/epl-2.0

  SPDX-License-Identifier: EPL-2.0
-->

## TELNET_LOG

| | |
|:---|:---|
| **Type	Funktionsbaustein** |  |
| **IN_OUT	IP_C** | IP_C (Parametrierungsdaten) |
| **S_BUF** | NETWORK_BUFFER (Sendedaten) |
| **LOG_CL** | LOG_CONTROL (LOG-Daten) |
| **INPUT	S_BUF_SIZE** | UINT (Größe des S_BUF) |
| **ENABLE** | BOOL  (TELNET Server freigeben) |
| **OPTION** | BYTE (Sende-Optionen) |
| **PORT** | WORD (Port Nummer) |
| **OUTPUT	READY** | BOOL  (TELNET Client hat Verbindung aufgebaut) |
| | TELNET_LOG wird benutzt um alle Meldungen die sich im LOG_CONTROL Ring-buffer befinden über TELNET auszugeben. Durch „ENABLE“ kann der Baustein aktiviert werden. Bei Parameter PORT kann die gewünschte Port-Nummer vorgegeben werden, wird diese Parameter nicht belegt so wird standardmäßig Port 23 verwendet. |
| | Mittels Parameter OPTION können verschiedene Optionen gewählt werden (Siehe Tabelle OPTION). Wird der Parameter OPTION nicht beschaltet, so wird folgende Einstellung standardmäßig verwendet. |
| | OPTION = BYTE#2#1000_1100; |
| | Sobald sich ein ein TELNET-Client mit dem Baustein verbindet, wird dies über Parameter „READY“ angezeigt. Daraufhin werden automatisch alle Meldungen an TELNET ausgegeben. Sobald im weiteren Verlauf neue Meldungen in LOG_CONTROL auflaufen werden diese immer wieder automatisch auch ausgegeben. Bei einen erneuten Verbindung ab/aufbau werden wieder alles Meldungen erneut ausgegeben. Die meisten TELNET-Clients bieten auch die Möglichkeit den Datenstrom in eine Datei umzuleiten, um hier eine langfristige Datenarchivierung zu ermöglichen. |
| **OPTION** |  |

![telnet_log](telnet_log.gif)

| BIT | Funktion | Beschreibung |
| --- | --- | --- |
| 0 | SCREEN_INIT | Nach dem Verbindungsaufbau mit der TELNET-Konsole wird der gesamte Bildschirm gelöscht.  Wenn die OPTION COLOR aktiviert ist, wird der Bildschirm mit BACK_COLOR gelöscht. |
| 1 | AUTOWRAP | Bei AUTOWRAP=1 wird der Schreib-Cursor bei erreichen des Zeilenendes automatisch auf eine nächste Zeile gesetzt. Wenn bei der Textausgabe die X,Y Positionen immer mit angegeben werden , ist es besser wenn AUTOWRAP=0 ist. |
| 2 | COLOR | Aktiviert die den Farbe-Modus , dabei werden BACK_COLOR und FRONT_COLOR bei der Ausgabe angewandt. |
| 3 | NEW_LINE | Bei NEW_LINE=1 wird automatisch am Ende des Textes ein Carriage Return und Line-Feed angehängt. So dass die nächste Textausgabe in einer neuen Zeile beginnt. Dies ist aber nur dann Sinnvoll, wenn keine X_POS und Y_POS vorgegeben werden. |
| 4 | RESERVE |  |
| 5 | RESERVE |  |
| 6 | RESERVE |  |
| 7 | NO_BUF_FLUSH | Verhindert das die Daten im Buffer sofort gesendet werden. Nur wenn der Buffer komplett gefüllt ist, oder diese Option deaktiviert ist, werden die Daten versendet. Ermöglicht das  schnelle Senden von vielen Texten im selben Zyklus |
