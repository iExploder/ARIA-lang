# How to build ARIA?

## Linux users

* OCaml >= 4.02 is preferred
* make

Make sure OCaml bin path is exported and just execute `make` under `src/`.

## Windows users

Execute following commands under `src/` with OCaml bin path exported.

```cmd
ocamlyacc parser.mly
ocamllex lexer.mll
ocamlopt -o aria.exe leas.ml syntax.ml parser.mli parser.ml lexer.ml aria.ml
```


## Installation of OCaml

### Linux

Installation with package manager is preferred.
Install `opam` (source-based package manager for OCaml) with your package manager and select an proper OCaml version to install with `opam`. 

### Windows

#### OCaml for Windows (Installer)

A full OCaml environment with OPAM based on Cygwin, with an easy-to-use installer.

Check [HERE](https://fdopen.github.io/opam-repository-mingw/installation/).

#### Build from source

According to OCaml's build manual,
several ports under Windows were provided.

* Native Microsoft(MSVC)
* Native Mingw-w64(GCC)
* Cygwin(GCC)

Follow [README](https://github.com/ocaml/ocaml/blob/trunk/README.win32.adoc) from official OCaml repository.