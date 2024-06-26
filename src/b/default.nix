{ buildGo, ... }@attrs:

buildGo.package {
  name = "sample/src/b";

  srcs = [
    ./main.go
  ];

  deps = [
    (import ../c attrs)
    (import ../../third_party/gopkgs/google.golang.org/grpc attrs)
    (import ../../third_party/gopkgs/google.golang.org/grpc attrs).codes
    (import ../../third_party/gopkgs/google.golang.org/grpc attrs).status
  ];
}
