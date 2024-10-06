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
      };

      defaultTemplate = self.templates.go;
    };
}
