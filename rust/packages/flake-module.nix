# Copyright 2024 Brian McGillion
# SPDX-License-Identifier: Apache-2.0
{
  perSystem =
    {
      pkgs,
      ...
    }:
    let
      inherit (pkgs) callPackage;
    in
    {
      packages = {
        hello-go = callPackage ./hello-go { };
      };
    };
}
