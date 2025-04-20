{ pkgs, ... }:
{
  plugins.vimwiki = {
    enable = true;
    package = pkgs.vimPlugins.vimwiki;
    settings = {
      list = [
        {
          ext = ".md";
        }
      ];
    };
  };
}
