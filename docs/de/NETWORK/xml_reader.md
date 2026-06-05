<!--
  Copyright (c) 2026 Hans Mühlbauer, Franz Höpfinger and others.

  This program and the accompanying materials are made available under the
  terms of the Eclipse Public License 2.0 which is available at
  https://www.eclipse.org/legal/epl-2.0

  SPDX-License-Identifier: EPL-2.0
-->

## XML_READER

| | | |
|:---|:---|:---|
| **Type	Funktionsbaustein** |  | |
| **IN_OUT	CTRL** | XML_CONTROL | |
| | (Steuer und Statusdaten) | |
| **BUF** | NETWORK_BUFFER  (Empfangsdaten) | |
| | Mittels XML_READER ist es möglich so genannte 'Well-formed' XML-Dokumente zu parsen. Hierbei werden nicht wie bei Hochsprachen üblich, die ganze XML-Daten eingelesen und als Datenstruktur im Speicher abgelegt, sonder es wird eine sehr Ressourcen schonende Variante angewandt. Der XML_READER liest XML-Daten als sequentiellen Datenstrom aus dem Buffer und meldet die im COMMAND definierte Elemente-Typen automatisch zurück. | |
| | Bei XML wird strikt zwischen Groß- und Kleinschreibung unterschieden. Ein XML-gerechtes Dokument besteht aus Elementen, Attributen, ihren Wertzuweisungen, und dem Inhalt der Elemente, der aus Text oder aus untergeordneten Elementen bestehen kann, die ihrerseits wieder Attribute mit Wertzuweisungen und Inhalt haben können. Es gibt Elemente mit und ohne Attribute, Elemente, innerhalb deren viele andere Elemente vorkommen können, und solche, innerhalb deren nur Text vorkommen kann, und sogar leere Elemente, die keinen Inhalt haben können. Die Struktur, die aus diesen Bestandteilen und ihren Grundregeln entsteht, lässt sich als Baumstruktur begreifen. Elemente bestehen immer aus Tags und End-Tags. Attribute sind zusätzliche Informationen zu Elementen. Es sind auch Kommentar-Elemente erlaubt , jedoch dürfen sich diese beim XML_READER nicht zwischen Start- und End-Tags von Elementen befinden. Die möglichen DTD – Document Type Definition werden nur als DTD-Element gemeldet, jedoch nicht weiter vom XML_READER inhaltlich ausgewertet und angewandt. Mit einem CDATA-Abschnitt wird einem Parser mitgeteilt, dass kein Markup folgt, sondern normaler Text, der mittels Start-End-Block zurück gemeldet. | |
| | Vor dem ersten Aufruf des XML_READER müssen ein paar Parameter in der CTRL Datenstruktur initialisiert werden. Mittels  CTRL.START_POS und CTRL.STOP_POS wird der Beginn und das Ende der XML-Daten im Buffer definiert. Mit CTRL.COMMAND kann einerseits ein Initialisierung (BIT15=TRUE) angestoßen werden, und mit Bit 0-14 kann definiert werden welche Element/Datentypen zurückgemeldet werden sollen. Dabei entsprechen die Typ-Codes der nachfolgenden Tabelle genau der Bit-Nummer die im CTRL.COMMAND dann jeweils auf TRUE gesetzt werden müssen. | |
| | Es wird immer versucht den Text von Element, Attribute, Value und Path in gesamter Länge an zugehörigen STRINGS zu übergeben. Bei STRINGS größer 255 Zeichen werden diese linksbündig abgeschnitten, jedoch mittels Block-Start und Block-End Parameter sehr wohl zurückgemeldet, so dass diese nachträglich trotzdem komplett ausgewertet werden können. Die BLOCK-START/STOP Index werden aber immer parallel zu den STRINGS mit übergeben. Wird der PATH-STRING größer 255 Zeichen so wird die PATH-Verfolgung deaktiviert, sodass nur noch „OVERFLOW“ als Text eingetragen ist. | |
| | Da bei sehr großen und komplexen XML-Daten nicht klar ist, wie lange es dauert bis der Baustein Daten zum Rückmelden findet, ist eine WATCHDOG Funktion integriert. Hiermit kann eine maximale Bearbeitungszeit parametriert werden. Beim Überschreiten der Zeit wird der Baustein-Aufruf automatisch abgebrochen, und im nächsten Zyklus wieder an gleicher Stelle fortgesetzt Dabei wird der Typ-Code 98 zurückgemeldet. | |
| | Folgende Typ-Kennungen sind definiert. | |
| | XML-Beispiel | |
| | Flache Darstellung | |
| **<?xml version="1.0" ?><rss version="2.0"><channel><!-- XML-Demo --><![CDATA[<b>CurrentConditions** | </b><br />]]><title>XML_Reader</title> <link>http://oscat.de</link></channel></rss> | |
| | Darstellung der Ebenen (ohne Processing-Instruction) | |
| | Darstellung als Baumansicht mit Elementtypen | |
| **Legende** |  | |
| **Anwendungs-Beispiel** |  | |
| | CASE STATE OF | |
| **00** |  | |
| **STATE** | = 10; | |
| **CTRL.START_POS** | = HTTP_GET.BODY_START; (Index des ersten Zeichen *) | |
| **CTRL.STOP_POS** | = HTTP_GET.BODY_STOP;  (Index des letzten Zeichen *) | |
| **CTRL.COMMAND** | = WORD#2#11111111_11111111; (* Init + alle Elemente melden *) | |
| **10** |  | |
| | (* XML Daten seriell lesen *) | |
| **XML_READER.CTRL** | = CTRL; | |
| **XML_READER.BUF** | = BUFFER; | |
| | XML_READER(); | |
| **CTRL** | = XML_READER.CTRL; | |
| **BUFFER** | = XML_READER.BUF; | |
| | IF CTRL.TYP = 99 THEN | |
| **STATE** | = 20; (* Exit – keine weiteren Elemente vorhanden *) | |
| | ELSIF CTRL.TYP < 98 THEN (* bei Timeout (Code 98) nichts machen *) | |
| | (* Auswertung der XML-Elemente über CTRL-Datenstruktur *) | |
| | END_IF; | |
| **20** |  | |
| | (* sonstiges...... *) | |
| | END_CASE; | |
| | Folgende Information werden dabei über die CTRL-Datenstruktur ausgegeben | |
| **-------- erster Durchlauf -------- COUNT** | 1 TYPE: | 5 	(OPEN ELEMENT - PROCESSING INSTRUCTION) LEVEL: 		1 ELEMENT: 		'xml' PATH: 		'/xml' -------- nächster Durchlauf -------- COUNT: 		2 TYPE: 		4 	(ATTRIBUTE) LEVEL: 		1 ELEMENT: 		'xml' ATTRIBUTE:		'version' VALUE:		'1.0' PATH: 		'/xml' -------- nächster Durchlauf -------- COUNT: 		3 TYPE: 		2 	(CLOSE ELEMENT) LEVEL: 		0 ELEMENT: 		'xml' PATH: 		'' -------- nächster Durchlauf -------- COUNT: 		4 TYPE: 		1 	(OPEN ELEMENT - Standard) LEVEL: 		1 ELEMENT: 		'rss' PATH: 		'/rss' -------- nächster Durchlauf -------- COUNT: 		5 TYPE: 		4 	(ATTRIBUTE) LEVEL: 		1 ELEMENT: 		'rss' ATTRIBUTE:		'version' VALUE:		'2.0' PATH: 		'/rss' -------- nächster Durchlauf -------- COUNT: 		6 TYPE: 		1 	(OPEN ELEMENT - Standard) LEVEL: 		2 ELEMENT: 		'channel' PATH: 		'/rss/channel' -------- nächster Durchlauf -------- COUNT: 		7 TYPE: 		13 	(COMMENT-ELEMENT) LEVEL: 		2 VALUE: 		' XML-Demo ' PATH: 		'/rss/channel' -------- nächster Durchlauf -------- COUNT: 		8 TYPE: 		12 	(CDATA) LEVEL: 		2 VALUE: 		'<b>Current Conditions:</b><br />' PATH: 		'/rss/channel' -------- nächster Durchlauf -------- COUNT: 		9 TYPE: 		1 	(OPEN ELEMENT - Standard) LEVEL: 		3 ELEMENT: 		'title' PATH: 		'/rss/channel/title' -------- nächster Durchlauf -------- COUNT: 		10 TYPE: 		3	(TEXT) LEVEL: 		3 ELEMENT: 		'title' VALUE: 		' XML_Reader' PATH: 		'/rss/channel/title' -------- nächster Durchlauf -------- COUNT: 		11 TYPE: 		2 	(CLOSE ELEMENT) LEVEL: 		2 ELEMENT: 		'title' PATH: 		'/rss/channel' -------- nächster Durchlauf -------- COUNT: 		12 TYPE: 		1 	(OPEN ELEMENT - Standard) LEVEL: 		3 ELEMENT: 		'link' PATH: 		'/rss/channel/link' -------- nächster Durchlauf -------- COUNT: 		13 TYPE: 		3	(TEXT) LEVEL: 		3 ELEMENT: 		'link' VALUE: 		'http://oscat.de' PATH: 		'/rss/channel/link' -------- nächster Durchlauf -------- COUNT: 		14 TYPE: 		2 	(CLOSE ELEMENT) LEVEL: 		2 ELEMENT: 		'link' PATH: 		'/rss/channel' -------- nächster Durchlauf -------- COUNT: 		15 TYPE: 		2 	(CLOSE ELEMENT) LEVEL: 		1 ELEMENT: 		'channel' PATH: 		'/rss' -------- nächster Durchlauf -------- COUNT: 		16 TYPE: 		2 	(CLOSE ELEMENT) LEVEL: 		0 ELEMENT: 		'rss' PATH: 		'' -------- nächster Durchlauf -------- COUNT: 		17 TYPE: 		99 	(EXIT – END OF DATA) |

![xml_reader](xml_reader.gif)
![xml_reader_schema1](xml_reader_schema1.gif)
![xml_reader_schema2](xml_reader_schema2.gif)
![xml_reader_schema3](xml_reader_schema3.gif)

| Typ (Code) | Datentyp | Beschreibung |
| --- | --- | --- |
| 00 | unbekannt | Undefiniertes Element gefunden |
| 01 | TAG (Element) | Beginn – des ElementDatenzeiger für Element über BLOCK1 |
| 02 | END-TAG (Element) | Ende – des Element |
| 03 | TEXT | Inhalt eines ElementDatenzeiger für Value über BLOCK1 |
| 04 | ATTRIBUTE | Attribute eines ElementDatenzeiger für Attribute über BLOCK1Datenzeiger für Value über BLOCK2 |
| 05 | TAG (Processing Instruction) | Anweisungen für die VerarbeitungDatenzeiger für Element über BLOCK1 |
| 12 | CDATA | Inhaltlich nicht analysierter TEXTDatenzeiger für Value über BLOCK1 |
| 13 | COMMENT | KommentarzeilenDatenzeiger für Value über BLOCK1 |
| 14 | DTD | Dokumenten Typ DeklarationDatenzeiger für Value über BLOCK1 |
| 98 | WATCHDOG | Maximale Durchlaufzeit erreicht- Abbruch |
| 99 | ENDE | Keine weiteren Elemente vorhanden |
