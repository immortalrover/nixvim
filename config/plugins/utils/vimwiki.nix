{ pkgs, ... }:
let
  vimwiki = pkgs.vimUtils.buildVimPlugin {
    name = "vimwiki";
    src = pkgs.fetchFromGitHub {
      owner = "immortalrover";
      repo = "vimwiki";
      rev = "bb90f5e2015f9f9794a41cf48aed73a88ee32e1e";
      hash = "sha256-8NQH0L7cstMFdc+MhzMp4MjbMN3P4NxGLs8mHn5zzbs=";
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
