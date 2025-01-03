# Copyright 2022-2024 TII (SSRC) and the Ghaf contributors
# SPDX-License-Identifier: Apache-2.0
{ inputs, lib, ... }:
{
  imports = [ inputs.devshell.flakeModule ];
  perSystem =
    {
      config,
      pkgs,
      inputs',
      ...
    }:
    {
      devshells.default = {
        devshell = {
          name = "Rust devshell";
          meta.description = "Rust development environment";
          packages =
            builtins.attrValues {
              inherit (pkgs)
  rust-analyzer
    rustc
    rustfmt
    cargo
    cargo-clone
    clippy
                ;
            }
            ++ [
              inputs'.nix-fast-build.packages.default
              config.treefmt.build.wrapper
            ]
            ++ lib.attrValues config.treefmt.build.programs;
        };

        commands = [
          # {
          #   help = "Check golang vulnerabilities";
          #   name = "go-checksec";
          #   command = "gosec ./...";
          # }
          # {
          #   help = "Update go dependencies";
          #   name = "go-update";
          #   command = "go get -u ./... && go mod tidy && go mod vendor";
          # }
          # {
          #   help = "golang linter";
          #   package = "golangci-lint";
          #   category = "linters";
          # }
        ];
      };
    };
}
