{ nixpkgs ? import <nixpkgs> {} } :

let
  inherit (nixpkgs) pkgs;
  ocamlPackages = pkgs.ocamlPackages;
  #ocamlPackages = pkgs.ocaml-ng.ocamlPackages_4_11;
  #ocamlPackages = pkgs.ocamlPackages_latest;
in

pkgs.stdenv.mkDerivation {
  name = "my-ocaml-env";
  buildInputs = [
    ocamlPackages.dune_3
    ocamlPackages.findlib # essential
    ocamlPackages.ocaml
    ocamlPackages.utop
    ocamlPackages.ocaml-lsp
    ocamlPackages.ppx_expect
    ocamlPackages.ppx_deriving
    ocamlPackages.ppx_import
    ocamlPackages.menhir
    
    pkgs.rlwrap

    # (pkgs.emacsWithPackages (epkgs: (with epkgs.melpaStablePackages; [
    #   ocamlPackages.dune_3
    # ])))

    pkgs.vscode
  ];
}
