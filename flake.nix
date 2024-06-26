{
  description = "Hello";

  inputs = {
    nixpkgs.url = "flake:nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        buildGo = (import ./lib/buildGo { inherit pkgs; });
        fetchGoModule = (import ./lib/fetchGoModule { inherit pkgs; });

        attrs = {
          inherit pkgs buildGo fetchGoModule;
        };
      in
      {
        packages = {
          hello = (import ./src/hello attrs);
          default = self.packages.${system}.hello;
        };
      }
    );
}
