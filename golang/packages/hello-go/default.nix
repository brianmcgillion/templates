# Copyright 2024 Brian McGillion
# SPDX-License-Identifier: Apache-2.0
{ pkgs, ... }:

pkgs.buildGoModule {
  pname = "hello-go-template";
  version = "v0.1";

  src = ./.;

  # use vendor has null to avoid creating a Fixed-Output derivation
  # if using the devshell the go-update will ensure that
  # `go mod vendor` is run to keep the vendor directory up to date
  # this is tracked so it will give the reproducibility of the build
  vendorSha256 = null;
}
