input-file := "thesis.typ"
output-file := "thesis.pdf"

default: build-diagrams build

build:
    @echo "=> Creating PDF..."
    typst compile --pdf-standard "a-4e" {{ input-file }}

dev:
    typst watch {{ input-file }}

[script]
build-diagrams:
    echo "=> Building drawio diagrams"
    for diag in assets/diagrams/*.drawio; do
        drawio "$diag" --export \
            --theme light \
            --embed-svg-fonts \
            --output "$diag.svg"
    done

clean:
    rm -f {{ output-file }}
    find assets/diagrams -name '*.drawio.bkp' -exec rm {} \;