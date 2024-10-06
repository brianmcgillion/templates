{
  description = "Templates for development";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = {

    templates = {

      go = {
        path = ./golang;
        description = "Go (Golang) development environment";
      };
      #default = go;
    };
  };
}
