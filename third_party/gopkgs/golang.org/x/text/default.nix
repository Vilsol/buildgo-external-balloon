# generator //third_party/mud (DO NOT EDIT)
{ pkgs, buildGo, fetchGoModule, ... }@attrs:

let
  out = buildGo.external rec {
    path = "golang.org/x/text";
    src = fetchGoModule {
      inherit path;
      version = "0.14.0";
      sha256 = "sha256-yh3B0tom1RfzQBf1RNmfdNWF1PtiqxV41jW1GVS6JAg=";
    };
  };
in
  out
