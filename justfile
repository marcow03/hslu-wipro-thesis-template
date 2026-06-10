default: build

build:
    @echo "Creating PDF..."
    typst compile dokumentation.typ

dev:
    typst watch dokumentation.typ
