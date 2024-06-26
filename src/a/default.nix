{ buildGo, ... }@attrs:

buildGo.package {
  name = "sample/src/a";

  srcs = [
    ./main.go
  ];

  deps = [
    (import ../b attrs)
    (import ../c attrs)
    (import ../../third_party/gopkgs/google.golang.org/grpc attrs)
    (import ../../third_party/gopkgs/google.golang.org/grpc attrs).codes
    (import ../../third_party/gopkgs/google.golang.org/grpc attrs).status
  ];
}
