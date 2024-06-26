# generator //third_party/mud (DO NOT EDIT)
{ pkgs, buildGo, fetchGoModule, ... }@attrs:

let
  out = buildGo.external rec {
    path = "google.golang.org/grpc";
    src = fetchGoModule {
      inherit path;
      version = "1.62.1";
      sha256 = "sha256-1su6X0YT7MUflrTJijbq1CiisADZHudEx5sJq01TEaE=";
    };
    deps = [
      (import ../../github.com/golang/protobuf attrs).proto # github.com/golang/protobuf
      (import ../../golang.org/x/net attrs).http2 # golang.org/x/net
      (import ../../golang.org/x/net attrs).http2.hpack # golang.org/x/net
      (import ../../golang.org/x/net attrs).trace # golang.org/x/net
      (import ../../golang.org/x/sys attrs).unix # golang.org/x/sys
      (import ../genproto/googleapis/rpc attrs).status # google.golang.org/genproto/googleapis/rpc
      (import ../protobuf attrs).encoding.protojson # google.golang.org/protobuf
      (import ../protobuf attrs).proto # google.golang.org/protobuf
      (import ../protobuf attrs).protoadapt # google.golang.org/protobuf
      (import ../protobuf attrs).reflect.protodesc # google.golang.org/protobuf
      (import ../protobuf attrs).reflect.protoreflect # google.golang.org/protobuf
      (import ../protobuf attrs).reflect.protoregistry # google.golang.org/protobuf
      (import ../protobuf attrs).runtime.protoimpl # google.golang.org/protobuf
      (import ../protobuf attrs).types.known.anypb # google.golang.org/protobuf
      (import ../protobuf attrs).types.known.durationpb # google.golang.org/protobuf
      (import ../protobuf attrs).types.known.timestamppb # google.golang.org/protobuf
    ];
  };
in
  out
