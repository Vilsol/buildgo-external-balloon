# generator //third_party/mud (DO NOT EDIT)
{ pkgs, buildGo, fetchGoModule, ... }@attrs:

let
  out = buildGo.external rec {
    path = "google.golang.org/genproto/googleapis/rpc";
    src = fetchGoModule {
      inherit path;
      version = "0.0.0-20240318140521-94a12d6c2237";
      sha256 = "sha256-P5SBku16dYnK4koUQxTeGwPxAAWH8rxbDm2pOzFLo/Q=";
    };
    deps = [
      (import ../../../protobuf attrs).reflect.protoreflect # google.golang.org/protobuf
      (import ../../../protobuf attrs).runtime.protoimpl # google.golang.org/protobuf
      (import ../../../protobuf attrs).types.known.anypb # google.golang.org/protobuf
      (import ../../../protobuf attrs).types.known.durationpb # google.golang.org/protobuf
    ];
  };
in
  out
