{ buildGo, ... }@attrs:

buildGo.program {
  name = "hello";

  srcs = [
    ./main.go
  ];

  deps = [
    (import ../../third_party/gopkgs/google.golang.org/grpc attrs)
    (import ../../third_party/gopkgs/google.golang.org/grpc attrs).codes
    (import ../../third_party/gopkgs/google.golang.org/grpc attrs).status
  ];
}
