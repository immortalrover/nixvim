let
  markdown_keymaps = [
    {
      mode = "i";
      key = ",f";
      action = "<Esc>/<++><CR>:nohlsearch<CR>\"_c4l";
      options = {
        buffer = true;
      };
    }
    {
      mode = "i";
      key = ",w";
      action = "<Esc>/ <++><CR>:nohlsearch<CR>\"_c5l<CR>";
      options = {
        buffer = true;
      };
    }
    {
      mode = "i";
      key = "<C-e>";
      action = "<Esc>/<++><CR>:nohlsearch<CR>\"_c4l";
      options = {
        buffer = true;
      };
    }
    {
      mode = "i";
      key = ",b";
      action = "**** <++><Esc>F*hi";
      options = {
        buffer = true;
      };
    }
    {
      mode = "i";
      key = ",s";
      action = "~~~~ <++><Esc>F~hi";
      options = {
        buffer = true;
      };
    }
    {
      mode = "i";
      key = ",i";
      action = "** <++><Esc>F*i";
      options = {
        buffer = true;
      };
    }
    {
      mode = "i";
      key = ",d";
      action = "`` <++><Esc>F`i";
      options = {
        buffer = true;
      };
    }
    {
      mode = "i";
      key = ",c";
      action = "```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA";
      options = {
        buffer = true;
      };
    }
    {
      mode = "i";
      key = ",m";
      action = "- [ ] ";
      options = {
        buffer = true;
      };
    }
    {
      mode = "i";
      key = ",1";
      action = "#<Space><Enter><++><Esc>kA";
      options = {
        buffer = true;
      };
    }
    {
      mode = "i";
      key = ",2";
      action = "##<Space><Enter><++><Esc>kA";
      options = {
        buffer = true;
      };
    }
    {
      mode = "i";
      key = ",3";
      action = "###<Space><Enter><++><Esc>kA";
      options = {
        buffer = true;
      };
    }
    {
      mode = "i";
      key = ",4";
      action = "####<Space><Enter><++><Esc>kA";
      options = {
        buffer = true;
      };
    }
  ];
in
{
  autoGroups = {
    filetypes = { };
  };

  files."ftdetect/terraformft.lua".autoCmd = [
    {
      group = "filetypes";
      event = [
        "BufRead"
        "BufNewFile"
      ];
      pattern = [
        "*.tf"
        " *.tfvars"
        " *.hcl"
      ];
      command = "set ft=terraform";
    }
  ];

  files."ftdetect/bicepft.lua".autoCmd = [
    {
      group = "filetypes";
      event = [
        "BufRead"
        "BufNewFile"
      ];
      pattern = [
        "*.bicep"
        "*.bicepparam"
      ];
      command = "set ft=bicep";
    }
  ];

  files."after/ftplugin/vimwiki.lua".keymaps = markdown_keymaps;
  files."after/ftplugin/markdown.lua".keymaps = markdown_keymaps;
}
