{ pkgs, ... }:
{
  plugins.vim-css-color = {
    enable = true;
    package = pkgs.vimPlugins.vim-css-color;
  };
}
