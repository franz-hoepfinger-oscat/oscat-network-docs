<!--
  Copyright (c) 2026 Hans Mühlbauer, Franz Höpfinger and others.

  This program and the accompanying materials are made available under the
  terms of the Eclipse Public License 2.0 which is available at
  https://www.eclipse.org/legal/epl-2.0

  SPDX-License-Identifier: EPL-2.0
-->

## SMTP_CLIENT

| | |
|:---|:---|
| **Type	Funktionsbaustein** |  |
| **IN_OUT	SERVER** | STRING (URL des SMTP-Server) |
| **MAILFROM** | STRING (Absenderadresse) |
| **MAILTO** | STRING(STRING_LENGTH) (Empfängeradresse) |
| **SUBJECT** | STRING (Betreff-Text) |
| **BODY** | STRING(STRING_LENGTH) (Email-Inhalt) |
| **FILES** | STRING(STRING_LENGTH) (Dateien anhänge) |
| **INPUT	ACTIVATE** | BOOL (positive Flanke startet die Abfrage) |
| **TIMEOUT** | TIME (Zeitüberwachung) |
| **DTI** | DT (aktuelles Datum-Uhrzeit) |
| **DTI_OFFSET** | INT (Zeitzonen Offset zu UTC) |
| **DNS_IP4** | DWORD (IP4-Adresse des DNS-Server) |
| **OUTPUT	DONE** | BOOL  (Transfer ohne Fehler beendet) |
| **BUSY** | BOOL  (Transfer ist aktiv) |
| **ERROR_C** | DWORD  (Fehlercode) |
| **ERROR_T** | BYTE  (Fehlertype) |
| | Der Baustein SMTP_CLIENT dient zum versenden von klassischen Emails. |
| **Folgenden Funktionen werden unterstützt** |  |
| | SMTP-Protokoll |
| | Extended-SMTP-Protokoll |
| | Versenden von Betreffzeile, und Inhaltstext |
| **Angabe von Email-Absenderadresse (From** | ) inklusive „Angezeigter Name“ |
| **Angabe von Empfänger(n) (To** | ) |
| **Angabe von CarbonCopy-Empfänger(n) (Cc** | ) |
| **Angabe von Blindcopy-Empfänger(n) (Bc** | ) |
| | Versenden von Datei(en) als Anhang |
| **Authentifizierungs-Verfahren** | OHNE,PLAIN,LOGIN,CRAM-MD5 |
| | Angabe der PORT-Nummer |
| | Mittels positiver Flanke bei ACTIVATE wird der Übertragungsvorgang gestartet.Der Parameter SERVER enthält den Namen des SMTP-Server und optional den Benutzernamen und das Passwort und eine Port-Nummer. Wird kein Benutzername bzw. Passwort übergeben, so wird nach Standard SMTP vorgegangen. |
| **Bei Angabe von Benutzer und Passwort wird Extend-SMTP benutzt, und automatisch das möglichst sicherste Authentifizierungs-Verfahren angewendet. Bei Parameter MAILFROM wird die Absenderadresse angeben** |  |
| | z.B. oscat@gmx.net |
| | optional kann ein zusätzlicher „Angezeigter Name“ hinzugefügt werden. Dieser wird vom Email-Client automatisch anstatt der echten Absenderadresse angezeigt. Damit kann immer ein leicht erkennbarer Name angewendet werden. |
| | z.B. oscat@gmx.net;Station_01 |
| | Der Email-Client zeigt als Absender dann „Station_01“ an.  Somit können mehrere Teilnehmer die gleiche Email-Adresse benutzen, jedoch eine eigenen „Alias“ Kennung mitsenden. |
| | Bei Parameter MAILTO können To,Cc,Bc angeben werden. Die verschiedene Empfängergruppen werden mittels '#' als Trennzeichen als Liste angegeben. Mehrere Adressen innerhalb der selben Gruppe werden mit dem Trennzeichen ';' unterteilt. Es können von jeder Gruppe beliebig viele Empfänger vorgegeben werden, einzige Beschränkung ist die Länge des MAILTO-Strings. |
| | To;To..#Cc;Cc...#Bc;Bc... |

![smtp_client](smtp_client.gif)
![ssl](ssl.gif)

**Beispiel:**

Beispiele.

o1@gmx.net;o2@gmx.net#o1@gmx.net#o2@gmx.net

definiert zwei To-Adressen, eine Cc-Adresse und eine Bc-Adresse

##o2@gmx.net

definiert nur eine Bc-Adresse

Mit SUBJECT kann ein Betreff-Text vorgeben werden, sowie bei BODY ein Email Inhalt als Text. Der aktuelle Date/Time Wert muss bei DTI , und bei DTI_OFFSET der Korrekturwert als Offset in Minuten zur UTC (Weltzeit) angegeben werden. Wenn bei DTI die Weltzeit UTC übergeben wird, muss bei DTI_OFFSET 0 übergeben werden.

Es können Dateien als Anhang versendet werden. Die Dateien müssen bei Parameter FILES in Listenform übergeben werden. Es können beliebig viele Dateien vorgegeben werden, einzige Beschränkung ist die Länge des FILES-Strings, und der Speicherplatz des Email-Postfachs (in der Praxis 5-30 Megabyte).

Durch eine zusätzliche optionale Angabe von '#DEL# kann nach erfolgreicher Übertragung der Dateien per Email, das Löschen der Dateien auf der Steuerung ausgelöst werden.

z.B.

FILES: 'log1.csv;log2.csv;#DEL#'

Die beiden Dateien werden nach erfolgreicher Übertragung gelöscht.

Die Überwachungszeit kann bei Parameter TIMEOUT vorgegeben werden. Bei DNS_IP4 muss die IP-Adresse des DNS-Servers angegeben werden, wenn bei SERVER ein DNS-Name angegeben wird.Sollten bei der Übertragung Fehler auftreten, werden diese bei ERROR_C und ERROR_T ausgegeben. Solange die Übertragung läuft ist BUSY = TRUE, und nach fehlerfreien Abschluss des Vorgangs wird DONE = TRUE. Sobald ein neuer Übertragungsvorgang gestartet wird, werden DONE,ERROR_T und ERROR_C rückgesetzt.

Der Baustein hat den IP_CONTROL integriert und muss somit nicht mehr extern mit diesen verknüpft werden, so wie dies normalerweise notwendig wäre.

SSL/TLS Verschlüsselung

SSL steht für Secure Socket Layer

TLS bedeutet Transport Layer Security

STARTTLS

Die Kommunikation zwischen client und Server beginnt unverschlüsselt
Wenn der Server und der Client SSL/TLS beherschen wird noch vor der Authorisierung auf Verschlüsselung der Daten umgeschaltet.
Der meistens benutzte Standardport ist Port 587

SSL

Die Kommunikation zwischen Client und Server beginnt sofort verschlüsselt. Der meistens benutzte Standardport ist Port 465

Hinweis !

Die SSL/TLS Verschlüsselung wird aktuell nur für Steuerungen von
Fa. Phoenix Contact unterstützt. Um diese Funktionalität nutzen zu können muss die SPS eine Firmware haben die SSL/TLS unterstützt.

Um die Datenverschlüsselung anzuwenden muss lediglich bei der
Server-URL als Protokoll „SSL://“ oder „TLS://“ vorgegeben werden.
(Siehe Server-URL Beispiele)

GMAIL Kompatibilität

Da Gmail immer mit maximaler Sicherheit arbeitet und ältere SSL/TLS Protokolle mitunter nicht mehr unterstützt kann es notwendig sein das für den SMTP_CLIENT Baustein Einstellungen am Gmail-Konto gemacht werden müssen. Ein spezielle Hinweis darauf ist der SMTP Fehlercode 534 bei GMail

Einige Apps und Geräte nutzen weniger sichere Anmeldetechnologien.
Dadurch wird Ihr Konto angreifbarer. Sie können den Zugriff für diese Apps deaktivieren (empfohlen) oder den Zugriff aktivieren, wenn Sie die Apps trotz des Risikos verwenden möchten.

https://support.google.com/accounts/answer/6010255?hl=de

Link für Einstellungsänderung

https://www.google.com/settings/security/lesssecureapps

Zugriff für weniger sichere Apps -> Aktivieren

SERVER: URL-Beispiele:

smtp_server

benutzername:password@smtp_server

benutzername:password@smtp_server:portnummer

TLS://benutzername:password@smtp_server

SSL://benutzername:password@smtp_server

Grundlagen:

http://de.wikipedia.org/wiki/SMTP-Auth

http://de.wikipedia.org/wiki/Simple_Mail_Transfer_Protocol

ERROR_T:

| Wert | Eigenschaften |
| --- | --- |
| 1 | Störung: DNS_CLIENTDie genaue Bedeutung von ERROR_C ist beim Baustein DNS_CLIENT nachzulesen |
| 2 | Störung: SMTP SteuerkanalDie genaue Bedeutung von ERROR_C ist beim Baustein IP_CONTROL nachzulesen |
| 4 | Störung: FILE_SERVERDie genaue Bedeutung von ERROR_C ist beim Baustein FILE_SERVER nachzulesen |
| 5 | Störung: ABLAUF – TIMEOUTERROR_C enthält im linken WORD die Ablauf-Schrittnummer, und im rechten WORD den zuletzt vom SMTP-Server empfangenen Response-Code.Achtung der Parameter muss zuerst als HEX-Wert betrachtet, in zwei WORDS geteilt werden,und dann als Dezimalzahl betrachtet werden. Beispiel:ERROR_T = 5ERROR_C = 0x0028_00FAAblauf-Schrittnummer 0x0028 = 40Response-Code 0x00DC = 250 |
