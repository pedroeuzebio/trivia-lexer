(lang dune 3.2)

(using menhir 2.1)

(generate_opam_files true)

(package
 (name trivia-lexer)
 (depends
   ocaml
   dune
   menhir)
 (allow_empty))
