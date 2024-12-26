{
  description = "Templates for development";

  outputs =
    { self }:
    {

      templates = {

        go = {
          path = ./golang;
          description = "Go (Golang) development environment";
        };
        rust = {
          path = ./rust;
          description = "Rust development environment";
        };
      };

      defaultTemplate = self.templates.go;
    };
}
