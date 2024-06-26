{ runCommand, importcfgCmd, spaceOut, go, ... }:

let
  embedfinder = runCommand "embedfinder" { } ''
    ${importcfgCmd { name = "embedfinder"; deps = []; }}
    ${go}/bin/go tool compile -o embedfinder.a -importcfg=importcfg -trimpath=$PWD -trimpath=${go} -p main ${./embed/embedfinder.go} ${./embed/embedcfg.go} ${./embed/filter.go} ${./embed/read.go}
    mkdir -p $out/bin
    ${go}/bin/go tool link -o $out/bin/embedfinder -importcfg=importcfg -buildid nix embedfinder.a
  '';

  embedfinderCmd = { srcs, embed_cfg ? null }:
    if (embed_cfg == null)
    then ''
      export EMBED_CFG=$(${embedfinder}/bin/embedfinder ${spaceOut srcs})

      export EMBED_FLAG=""
      if test -n "$EMBED_CFG"
      then
        export EMBED_FLAG="-embedcfg=$EMBED_CFG"
      fi
    '' else ''
      echo '${builtins.toJSON embed_cfg}' > embedcfg
      export EMBED_FLAG="-embedcfg=embedcfg"
    '';
in
  embedfinderCmd
