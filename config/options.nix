{
  config.vim = {
    viAlias = true;
    vimAlias = true;

    # autocomplete.blink-cmp = {
    #   enable = true;
    #   setupOpts = {
    #     cmdline.sources = null;
    #     cmdline.keymap.preset = "default";
    #     cmdline.completion.menu.auto_show = true; # not really needed but helps
    #   };
    # };

    autocomplete.nvim-cmp = {
      enable = true;
      # mappings = {
      #   confirm = "<Tab>";
      #   next = "<C-j>";
      #   previous = "<C-k>";
      # };
      sourcePlugins = [
        "cmp-path"
      ];
      setupOpts.sorting.comparators = [
        {
          _type = "lua-inline";
          expr = "deprio(kinds.Text)";
        }
        "exact"
        "score"
        "kind"
        "length"
        "sort_text"
        "offset"
      ];
    };

    snippets.luasnip.enable = true;
    autopairs.nvim-autopairs.enable = true;

    git = {
      enable = true;
      gitsigns.enable = true;
      gitsigns.codeActions.enable = false; # throws an annoying debug message
    };

    minimap = {
      minimap-vim.enable = false;
      codewindow.enable = true; # lighter, faster, and uses lua for configuration
    };

    binds = {
      whichKey.enable = true;
    };

    # Enable custom theming options
    dashboard.dashboard-nvim.enable = true;

    theme = {
      enable = true;
      name = "rose-pine";
      style = "main";
      transparent = false;
    };

    visuals = {
      nvim-web-devicons = {
        enable = true;
      };
    };

    formatter = {
      conform-nvim.enable = true;
    };
    # diagnostics = {
    #   nvim-lint.enable = true;
    # };

    languages = {
      # OPTIONS
      # enableDAP = true;
      enableLSP = true;
      enableTreesitter = true;
      # enableFormat = true;

      #LANGUAGES
      nix = {
        enable = true;
        extraDiagnostics.enable = true;
        lsp = {
          server = "nixd";
          # options = {
          #   nixos = {
          #     expr = ''(builtins.getFlake "github:NobbZ/nixos-config").nixosConfigurations.mimas.options'';
          #   };
          #   home_manager = {
          #     expr = ''(builtins.getFlake "github:NobbZ/nixos-config").homeConfigurations.nmelzer@mimas.options'';
          #   };
          };
        };
        format = {
          enable = true;
        };
      };
      bash = {
        enable = true;
        extraDiagnostics.enable = true;
        # format.enable = true;
      };
      css = {
        enable = true;
      };
    };

    luaConfigPre =
      # lua
      ''
        -- Highlight on yank
        vim.cmd[[
        augroup highlight_yank
        autocmd!
        au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
        augroup END
        ]]

        -- Save Cursor Position on file, after exiting
        vim.api.nvim_create_autocmd("BufReadPost", {
          desc = "Go To The Last Cursor Position",
          callback = function()
            local last_pos = vim.fn.line("'\"")
            local last_line = vim.fn.line("$")

            if last_pos > 1 and last_pos <= last_line then
              vim.cmd("normal! g`\"")
            end
          end,
        })
      '';

    #luaConfigPost =
    # lua
    #  ''
    #    -- Temp fix tab for cmdline caused by blink
    #    vim.cmd("cunmap <Tab>")
    #  '';

    utility = {
      surround = {
        enable = true;
        setupOpts.keymaps = {
          change = "cs";
        };
      };
    };

    statusline.lualine = {
      enable = true;
      theme = "auto";
      activeSection = {
        z = [
          ''
            {
              require('tmux-status').tmux_windows,
              cond = require('tmux-status').show,
              padding = { left = 3 },
            }
          ''
        ];
      };
      componentSeparator.left = "";
    };

    ui = {
      borders.enable = true;
      colorizer.enable = true;
    };

    telescope = {
      enable = true;
      mappings = {
        liveGrep = "<leader>fw";
      };
      setupOpts = {
        defaults = {
          path_display = ["truncate"];
        };
        extensions = {
          file_browser = {
            path = ":%:p:h";
            cwd_to_path = true;
            initial_mode = "normal";
          };
        };
      };
    };
    treesitter = {
      context.enable = true;
    };

    useSystemClipboard = true;

    options = {
      backup = false;
      # completeopt = ''{ "menuone", "noselect" }'';
      conceallevel = 0;
      fileencoding = "utf-8";
      hidden = true;
      ignorecase = true;
      mouse = "a";
      pumheight = 8;
      pumblend = 10;
      showmode = false;
      smartcase = true;
      smartindent = true;
      splitbelow = true;
      splitright = true;
      swapfile = true;
      timeoutlen = 500;
      undofile = true;
      updatetime = 250;
      writebackup = false;
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
      cursorline = true;
      number = true;
      relativenumber = true;
      numberwidth = 4;
      signcolumn = "yes";
      wrap = true;
      scrolloff = 8;
      sidescrolloff = 8;
      lazyredraw = true;
      termguicolors = true;
      # spelllang= "en,cjk,";
    };
  };
}
