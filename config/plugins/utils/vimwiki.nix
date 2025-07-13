{ pkgs, ... }:
let
  vimwiki = pkgs.vimUtils.buildVimPlugin {
    name = "vimwiki";
    src = pkgs.fetchFromGitHub {
      owner = "immortalrover";
      repo = "vimwiki";
      rev = "ea6b99b95f8d08f782bc4bdec77fbec6dffebad5";
      hash = "sha256-sSpbzu3BPYgf27m/pflEnxjniPIqLEOWP4cYajsHPoo=";
    };
  };
in
{
  plugins.vimwiki = {
    enable = true;
    package = vimwiki;
    settings = {
      auto_header = 1;
      list = [
        {
          ext = ".md";
          path = "~/.data/";
        }
      ];
    };
  };
}
