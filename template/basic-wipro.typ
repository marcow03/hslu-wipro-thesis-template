#import "title-page.typ": title-page

#let basic-wipro(
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
  scanned-signature-page: none,
  abstract,
  doc,
  bibliography: "",
  abbreviations: "",
  figure-outline: "",
  table-outline: "",
  ai: "",
) = {
  set page(numbering: none)
  set heading(outlined: false)
  set text(font: ("Times New Roman", "Libertinus Serif"))

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
    scanned-signature-page: scanned-signature-page,
  )

  counter(page).update(1)

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

  set heading(numbering: "1.1.1", outlined: true)
  show heading: it => {
    if (it.level >= 4) {
      block(it.body)
    } else {
      block(counter(heading).display() + " " + it.body)
    }
  }
  show heading.where(level: 1): it => {
    pagebreak()
    it
  }

  show link: underline
  set par(spacing: 1.5em)
  set quote(block: true)

  doc

  if (abbreviations != "" or bibliography != "" or figure-outline != "" or table-outline != "") {
    set heading(numbering: none, outlined: false)
    show heading: it => {
      block(it.body)
    }
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
    if ai != "" {
      pagebreak()
      ai
    }
  }
}
