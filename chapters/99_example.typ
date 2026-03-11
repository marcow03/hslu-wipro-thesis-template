#import "../template/utils.typ": code, qr-code-link

= Heading Example
#lorem(50)

== Subheading Example
#lorem(50)

=== Subsubheading Example
#lorem(50)

#pagebreak()

= Table Example
Here is a simple table:
#figure(
  caption: [Example Table],
  kind: table,
  table(
    columns: (auto, auto, auto),
    inset: 10pt,
    align: horizon,
    table.header([*Column 1*], [*Column 2*], [*Column 3*]),
    [Row 1], [Data A], [Value 1],
    [Row 2], [Data B], [Value 2],
    [Row 3], [Data C], [Value 3],
  ),
)

= Image Example
Here is an Example on how to include an image which is also listed in the image outline.

#align(center)[
  #figure(
    kind: image,
    caption: [Example Image],
    image("../assets/hslu-logo.svg", width: 50%),
  )
]

= Source Example
This is based on @someExampleSource. Sources will automatically appear if they are cited. Add them to
`bibliography.yaml`

= Code Example
Here is a code block:
// this needs to be imported first
// then you can use it like this:
#code(lang: "sh")[
  sudo rm -rf / --no-preserve-root
]

= QR Code Link Example
#qr-code-link(
  "https://www.youtube.com/watch?v=xvFZjo5PgG0",
)[
  Check this out!
]
