<!--
  Copyright (c) 2026 Hans Mühlbauer, Franz Höpfinger and others.

  This program and the accompanying materials are made available under the
  terms of the Eclipse Public License 2.0 which is available at
  https://www.eclipse.org/legal/epl-2.0

  SPDX-License-Identifier: EPL-2.0
-->

## TN_SC_AREA_RESTORE

| | |
|:---|:---|
| **Type** | Funktionsbaustein |
| **IN_OUT	Xus_TN_SCREEN** | us_TN_SCREEN |
| | Der Baustein TN_SC_AREA_RESTORE ermöglicht das wiederherstellen des zuvor gesicherten Bildschirmbereiches.Die im Datenbereich Xus_TN_SCREEN.bya_BACKUP[x] abgelegten Bildschirmdaten werden mit Hilfe der hinterlegten Koordinaten wiederhergestellt. Dies wird vorwiegend nach dem Aufruf vom Baustein MENU-BAR und MENU-POPUP durchgeführt, um den veränderten Bildschirmbereich wiederherzustellen. |

![TN_SC_AREA_RESTORE](TN_SC_AREA_RESTORE.gif)
