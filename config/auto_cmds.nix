{
  autoGroups = {
    highlight_yank = { };
    vim_enter = { };
    indentscope = { };
    restore_cursor = { };
    markdown = { };
  };

  autoCmd = [
    {
      group = "highlight_yank";
      event = [ "TextYankPost" ];
      pattern = "*";
      callback = {
        __raw = ''
          function()
            vim.highlight.on_yank()
          end
        '';
      };
    }
    {
      group = "vim_enter";
      event = [ "VimEnter" ];
      pattern = "*";
      callback = {
        __raw = ''
          function()
            vim.cmd('Startup')
          end
        '';
      };
    }
    {
      group = "indentscope";
      event = [ "FileType" ];
      pattern = [
        "help"
        "Startup"
        "startup"
        "neo-tree"
        "Trouble"
        "trouble"
        "notify"
      ];
      callback = {
        __raw = ''
          function()
            vim.b.miniindentscope_disable = true
          end
        '';
      };
    }
    ## from NVChad https://nvchad.com/docs/recipes (this autocmd will restore the cursor position when opening a file)
    {
      group = "restore_cursor";
      event = [ "BufReadPost" ];
      pattern = "*";
      callback = {
        __raw = ''
          function()
            if
              vim.fn.line "'\"" > 1
              and vim.fn.line "'\"" <= vim.fn.line "$"
              and vim.bo.filetype ~= "commit"
              and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
            then
              vim.cmd "normal! g`\""
            end
          end
        '';
      };
    }
    {
      group = "markdown";
      event = [ "FileType" ];
      pattern = [ "md" ];
      callback = {
        __raw = ''
          vim.keymaps.set("i", ",f", [[<Esc>/<++><CR>:nohlsearch<CR>"_c4l]], {buffer = true})
          vim.keymaps.set("i", ",b", [[**** <++><Esc>F*hi]], {buffer=true})
        '';
      };
    }
  ];
}
