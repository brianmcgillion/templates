# Copyright 2022-2024 TII (SSRC) and the Ghaf contributors
# SPDX-License-Identifier: Apache-2.0
{
  perSystem =
    {
      config,
      pkgs,
      inputs',
      ...
    }:
    {
      devShells.default = pkgs.mkShell {
        name = "Golang devshell";
        meta.description = "Golang development environment";
        #TODO look at adding Mission control etc here
        inputsFrom = [
          config.treefmt.build.programs # See ./treefmt.nix
          config.treefmt.build.wrapper
          config.pre-commit.devShell
        ];
        packages =
          builtins.attrValues {
            inherit (pkgs)
              go
              gomodifytags
              gopls
              gore
              gotests
              gotools
              golangci-lint
              ;
          }
          ++ [ inputs'.nix-fast-build.packages.default ];
      };
    };
}
