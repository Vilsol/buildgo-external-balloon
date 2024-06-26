# generator //third_party/mud (DO NOT EDIT)
{ pkgs, buildGo, fetchGoModule, ... }@attrs:

let
  out = buildGo.external rec {
    path = "google.golang.org/protobuf";
    src = fetchGoModule {
      inherit path;
      version = "1.33.0";
      sha256 = "sha256-cWwQjtUwSIEkAlAadrlxK1PYZXTRrV4NKzt7xDpJgIU=";
    };
  };
in
  out
