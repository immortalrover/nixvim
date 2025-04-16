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

  files = {
    "ftdetect/terraformft.lua".autoCmd = [
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

    "ftdetect/bicepft.lua".autoCmd = [
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

    "after/ftplugin/vimwiki.lua" = {
      autoCmd = [
        {
          event = [ "BufNewFile" ];
          callback = {
            __raw = ''
              function ()
                local template_dir = vim.fn.expand('~/vimwiki/templates/')
                local filename = vim.fn.expand('%:t:r')
                local ft = vim.o.filetype
                local template_path = template_dir .. ft .. '.tmpl'
                if vim.fn.filereadable(template_path) == 1 then
                  local lines = vim.fn.readfile(template_path)
                  vim.api.nvim_buf_set_lines(0,0,-1,false,lines)
                  vim.cmd([[
                    %s/%FILENAME%/\=expand("%:t:r")/g
                  ]])
                end
              end
            '';
          };
        }
      ];
      keymaps = markdown_keymaps ++ [
        {
          mode = "n";
          key = "<leader>mp";
          action = {
            __raw = ''
              function ()
                vim.cmd("set ft=markdown")
                vim.cmd("MarkdownPreview")
                vim.cmd("set ft=vimwiki")
              end
            '';
          };
        }
        {
          mode = "i";
          key = ",a";
          action = "<Esc>2jO* <CR><++><CR><Esc>2kla";
          options = {
            buffer = true;
          };
        }
      ];
    };
    "after/ftplugin/markdown.lua".keymaps = markdown_keymaps;
  };
}
