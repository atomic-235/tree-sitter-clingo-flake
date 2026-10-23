# tree-sitter-clingo-flake

The [Clingo/ASP](https://potassco.org/clingo/) grammar for tree-sitter, built
with `tree-sitter.buildGrammar` from a pinned upstream revision.

Used by [clingo.nvim](https://github.com/atomic-235/clingo.nvim) for syntax
highlighting and for the structural half of its diagnostics.

## Usage

```nix
{
  inputs.tree-sitter-clingo-flake.url = "github:atomic-235/tree-sitter-clingo-flake";
  inputs.tree-sitter-clingo-flake.inputs.nixpkgs.follows = "nixpkgs";
}
```

```nix
nixpkgs.overlays = [ inputs.tree-sitter-clingo-flake.overlays.default ];
# pkgs.tree-sitter-clingo
```

The package exposes the compiled grammar as `$out/parser` plus the upstream
query files under `$out/queries`. With home-manager:

```nix
xdg.dataFile = {
  "nvim/site/parser/clingo.so".source = "${pkgs.tree-sitter-clingo}/parser";
  "nvim/site/queries/clingo/highlights.scm".source = "${pkgs.tree-sitter-clingo}/queries/highlights.scm";
};
```

## Updating

Upstream is tracked by a pinned `rev` and `hash` in `package.nix`; there is no
CI. Bump them by editing both fields, e.g.:

```sh
nix store prefetch-file --json --hash-type sha256 \
  "https://github.com/potassco/tree-sitter-clingo/archive/<rev>.tar.gz"
```

and set `rev` to the commit and `hash` to the reported SRI hash.
