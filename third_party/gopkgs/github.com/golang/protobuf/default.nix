# generator //third_party/mud (DO NOT EDIT)
{ pkgs, buildGo, fetchGoModule, ... }@attrs:

let
  out = buildGo.external rec {
    path = "github.com/golang/protobuf";
    src = fetchGoModule {
      inherit path;
      version = "1.5.4";
      sha256 = "sha256-N3+Lv9lEZjrdOWdQhFj6Y3Iap4rVLEQeI8/eFFyAMZ0=";
    };
    deps = [
      (import ../../../google.golang.org/protobuf attrs).encoding.protojson # google.golang.org/protobuf
      (import ../../../google.golang.org/protobuf attrs).encoding.prototext # google.golang.org/protobuf
      (import ../../../google.golang.org/protobuf attrs).encoding.protowire # google.golang.org/protobuf
      (import ../../../google.golang.org/protobuf attrs).proto # google.golang.org/protobuf
      (import ../../../google.golang.org/protobuf attrs).reflect.protodesc # google.golang.org/protobuf
      (import ../../../google.golang.org/protobuf attrs).reflect.protoreflect # google.golang.org/protobuf
      (import ../../../google.golang.org/protobuf attrs).reflect.protoregistry # google.golang.org/protobuf
      (import ../../../google.golang.org/protobuf attrs).runtime.protoiface # google.golang.org/protobuf
      (import ../../../google.golang.org/protobuf attrs).runtime.protoimpl # google.golang.org/protobuf
      (import ../../../google.golang.org/protobuf attrs).types.known.anypb # google.golang.org/protobuf
      (import ../../../google.golang.org/protobuf attrs).types.known.durationpb # google.golang.org/protobuf
      (import ../../../google.golang.org/protobuf attrs).types.known.structpb # google.golang.org/protobuf
      (import ../../../google.golang.org/protobuf attrs).types.known.timestamppb # google.golang.org/protobuf
      (import ../../../google.golang.org/protobuf attrs).types.known.wrapperspb # google.golang.org/protobuf
    ];
  };
in
  out
