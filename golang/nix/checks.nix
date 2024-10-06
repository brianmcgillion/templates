# Copyright 2024 Brian McGillion
# SPDX-License-Identifier: Apache-2.0
{ inputs, ... }:
{
  imports = [ inputs.git-hooks-nix.flakeModule ];
  perSystem =
    {
      pkgs,
      self',
      lib,
      ...
    }:
    {
      checks = {
        reuse = pkgs.runCommandLocal "reuse-lint" { buildInputs = [ pkgs.reuse ]; } ''
          cd ${../.}
          reuse lint
          touch $out
        '';
      } // (lib.mapAttrs' (n: lib.nameValuePair "package-${n}") self'.packages);

      pre-commit.settings = {
        hooks = {
          gofmt.enable = true;
          govet.enable = true;
          golangci-lint.enable = true;
          gotest.enable = true;
        };
      };
    };
}
