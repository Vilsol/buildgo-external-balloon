# generator //third_party/mud (DO NOT EDIT)
{ pkgs, buildGo, fetchGoModule, ... }@attrs:

let
  out = buildGo.external rec {
    path = "golang.org/x/net";
    src = fetchGoModule {
      inherit path;
      version = "0.22.0";
      sha256 = "sha256-pcefO4noO9I6mATKBWF6shgIjZvFg0kDsV1Jo/NsFns=";
    };
    deps = [
      (import ../sys attrs).unix # golang.org/x/sys
      (import ../text attrs).encoding # golang.org/x/text
      (import ../text attrs).encoding.charmap # golang.org/x/text
      (import ../text attrs).encoding.htmlindex # golang.org/x/text
      (import ../text attrs).secure.bidirule # golang.org/x/text
      (import ../text attrs).transform # golang.org/x/text
      (import ../text attrs).unicode.bidi # golang.org/x/text
      (import ../text attrs).unicode.norm # golang.org/x/text
    ];
  };
in
  out
