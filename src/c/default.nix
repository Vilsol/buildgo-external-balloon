{ buildGo, ... }@attrs:

buildGo.package {
  name = "sample/src/c";

  srcs = [
    ./main.go
  ];

  deps = [
    (import ../../third_party/gopkgs/google.golang.org/grpc attrs)
    (import ../../third_party/gopkgs/google.golang.org/grpc attrs).codes
    (import ../../third_party/gopkgs/google.golang.org/grpc attrs).status
  ];
}
