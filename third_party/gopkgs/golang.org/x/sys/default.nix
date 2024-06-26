# generator //third_party/mud (DO NOT EDIT)
{ pkgs, buildGo, fetchGoModule, ... }@attrs:

let
  out = buildGo.external rec {
    path = "golang.org/x/sys";
    src = fetchGoModule {
      inherit path;
      version = "0.18.0";
      sha256 = "sha256-bIFhfFp7Sj0E1gcE3X3l/jecCfSRLgrkb8f0Yr6tVR0=";
    };
  };
in
  out
