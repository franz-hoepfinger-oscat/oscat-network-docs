#import "@preview/orange-book:0.7.1": book

#let horizontalrule = line(length: 100%, stroke: 0.5pt + luma(150))

#show: book.with(
  title: "OSCAT Network Dokumentation",
  author: "Franz Höpfinger",
  date: "2022-2026",
  copyright: [2022-2026, Meisterschulen am Ostbahnhof - München],
  lang: "de",
  main-color: rgb("#3F51B5"),
)

// Override heading level 1 to avoid pagebreak container bugs in orange-book theme
#show heading.where(level: 1): it => {
  pagebreak(to: "odd")
  v(1.5cm, weak: true)
  text(size: 2.2em, fill: rgb("#3F51B5"), weight: "bold", it.body)
  v(1.5cm, weak: true)
}

#include "book.typ"
