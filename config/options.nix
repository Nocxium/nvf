{ pkgs, ... }:
{
  config.vim = {
    viAlias = true;
    vimAlias = true;

    autocomplete.nvim-cmp.enable = true;
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
      name = "catppuccin";
      style = "mocha";
      transparent = false;
    };

    visuals = {
      nvim-web-devicons = {
        enable = true;
      };
    };

    languages = {
      # OPTIONS
      # enableDAP = true;
      enableLSP = true;
      enableTreesitter = true;

      #LANGUAGES
      # bash.enable = isBash;
      # css.enable = isWeb;
      # html.enable = isWeb;
      # java.enable = isJava;
      # lua.enable = isLua;
      nix.enable = true;
      # python.enable = isPython;
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

    # lsp = {
    #   lspsaga = {
    #     enable = true;
    #     mappings = {
    #       rename = "<leader>lr";
    #     };
    #   };
    # };

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
