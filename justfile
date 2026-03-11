default: build

build:
    @echo "Creating PDF..."
    typst compile dokumentation.typ WIPRO.pdf

dev:
    typst watch dokumentation.typ
