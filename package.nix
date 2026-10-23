{
  lib,
  tree-sitter,
  fetchFromGitHub,
}:

tree-sitter.buildGrammar {
  language = "clingo";
  version = "2025-07-04";

  src = fetchFromGitHub {
    owner = "potassco";
    repo = "tree-sitter-clingo";
    rev = "58e062c1c6c2ac0bad54fee054573c5a9e6dd759";
    hash = "sha256-rygMKByGqO0P0ftNezCJxWkZJVIsZv9j91avaUWQ3Sk=";
  };

  meta = with lib; {
    description = "Clingo/ASP grammar for tree-sitter";
    homepage = "https://github.com/potassco/tree-sitter-clingo";
    license = licenses.mit;
  };
}
