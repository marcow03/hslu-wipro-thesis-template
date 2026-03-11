#import "template/basic-wipro.typ": *

#let abstract = [
  = Abstract
  Here you write the Abstract
]

#set text(lang: "de")

#show: doc => basic-wipro(
  logo: image("assets/hslu-logo.svg", width: 30%),
  title: "Titel der WIPRO",
  students: (
    "Student 1",
    "Student 2",
  ),
  year: "2026",
  institution: "HSLU",
  study-program: "BSc Informatik",
  supervisor: "Supervisor Name",
  expert: "Expert Name",
  client: "Client/Company Name",
  public: false,
  secret: true,
  abstract,
  doc,
  bibliography: include "outlines/bibliography.typ",
  abbreviations: include "outlines/abbreviations.typ",
  figure-outline: include "outlines/figure-outline.typ",
  table-outline: include "outlines/tables.typ",
)

#pagebreak()

// TODO: Remove example chapter before final submission
#include "chapters/99_example.typ"

#include "chapters/01_problem-fragestellung-vision.typ"
#include "chapters/02_stand-der-technik.typ"
#include "chapters/03_ideen-und-konzepte.typ"
#include "chapters/04_methoden.typ"
#include "chapters/05_realisierung.typ"
#include "chapters/06_validation-und-evaluation.typ"
#include "chapters/07_ausblick.typ"
#include "chapters/08_anhang.typ"
