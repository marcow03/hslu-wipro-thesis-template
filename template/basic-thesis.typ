#import "title-page.typ": title-page
#import "utils.typ": in-outline

#let basic-thesis(
  logo: image,
  title: "",
  students: (),
  year: "",
  institution: "",
  study-program: "",
  supervisor: "",
  expert: "",
  client: "",
  public: false,
  secret: false,
  thesis-type: "",
  scanned-signature-page: none,
  bibliography: "",
  abbreviations: "",
  figure-outline: "",
  table-outline: "",
  code-outline: "",
  abstract: "",
  doc,
) = {
  set text(font: ("Times New Roman", "Libertinus Serif"), lang: "de")
  set heading(numbering: none, outlined: false)
  show heading: set block(above: 2em, below: 1em)

  title-page(
    logo: logo,
    title: title,
    students: students,
    year: year,
    institution: institution,
    study-program: study-program,
    supervisor: supervisor,
    expert: expert,
    client: client,
    public: public,
    secret: secret,
    thesis-type: thesis-type,
    scanned-signature-page: scanned-signature-page,
  )

  counter(page).update(1)

  show link: underline
  show ref: underline
  show figure.caption: set text(fill: luma(100))
  show figure.caption: set block(inset: (y: 0.5em))
  show figure.where(kind: raw): set figure(supplement: "Code")
  show figure.where(kind: raw): set align(left)
  show outline: it => {
    in-outline.update(true)
    it
    in-outline.update(false)
  }

  set quote(block: true)
  set text(hyphenate: true)
  set par(spacing: 1.5em)
  set quote(block: true)
  set list(indent: 1em, body-indent: 1em)
  set table(stroke: (y: 0.5pt, x: none))

  set page(
    footer: context [
      #align(
        right + horizon,
        counter(page).display(
          "1 von 1",
          both: true,
        ),
      )
    ],
  )

  abstract

  pagebreak()
  outline(title: "Inhaltsverzeichnis", depth: 3)

  if abbreviations != "" {
    pagebreak()
    abbreviations
  }
  if bibliography != "" {
    pagebreak()
    bibliography
  }
  if figure-outline != "" {
    pagebreak()
    figure-outline
  }
  if table-outline != "" {
    pagebreak()
    table-outline
  }
  if code-outline != "" {
    pagebreak()
    code-outline
  }

  set heading(numbering: "1.1.1", outlined: true)
  show heading: it => {
    if (it.level <= 4) {
      block(counter(heading).display() + " " + it.body)
    } else {
      block(it.body)
    }
  }
  show heading.where(level: 1): it => {
    pagebreak()
    it
  }
  set par(leading: 1.3em)

  doc
}
