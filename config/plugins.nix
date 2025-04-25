{pkgs, ...}: let
  tmux-status = pkgs.vimUtils.buildVimPlugin {
    name = "tmux-status";
    src = pkgs.fetchFromGitHub {
      owner = "christopher-francisco";
      repo = "tmux-status.nvim";
      rev = "18268e1044eff72dab201069204b402ee4d09bda";
      hash = "sha256-1qGvLaKgRA0CXldx5k+/3y3Q4ypGs1CwcAPfoenxod8=";
    };
  };

  everforest-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "everforest-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "neanias";
      repo = "everforest-nvim";
      rev = "135cc21a45756e688dd1a3cbeb1c80a04b569b46";
      hash = "sha256-X+GaH76afaWmszGuLYf9VHP134jvmUCVSB7C7aiPSOs=";
    };
  };
  gruvbox-material = pkgs.vimUtils.buildVimPlugin {
    name = "gruvbox-material";
    src = pkgs.fetchFromGitHub {
      owner = "sainnhe";
      repo = "gruvbox-material";
      rev = "f5f912fbc7cf2d45da6928b792d554f85c7aa89a";
      hash = "sha256-r3a0fhRpEqrAE6QQwBV7DmGoT/YSOhDPl5Nk8evNplE=";
    };
  };
in {
  config.vim = {
    extraPlugins = with pkgs.vimPlugins; {
      telescope-file-browser = {
        package = telescope-file-browser-nvim;
      };

      tmux-status = {
        package = tmux-status;
        setup = ''
          require('tmux-status').setup {opts = {}}
        '';
      };

      everforest-nvim = {
        package = everforest-nvim;
        setup = ''
          require("everforest").setup({
            background = "hard",
          })
          vim.cmd("colorscheme everforest")
        '';
      };

      # gruvbox-material = {
      #   package = gruvbox-material;
      #   setup = ''
      #     vim.cmd("colorscheme gruvbox-material")
      #   '';
      # };

      neogit = {
        package = neogit;
        setup = "require('neogit').setup {}";
      };

      oil = {
        package = oil-nvim;
        setup = "require('oil').setup {}";
      };

      suda = {
        package = vim-suda;
      };

      colorizer = {
        package = nvim-colorizer-lua;
        setup = "require('colorizer').setup {}";
      };

      flash-nvim = {
        package = flash-nvim;
      };

      vim-startuptime = {
        package = vim-startuptime;
      };

      diffview-nvim = {
        package = diffview-nvim;
      };

      plenary = {
        package = plenary-nvim;
      };

      harpoon = {
        package = harpoon;
        setup = "require('harpoon').setup {}";
      };

      vim-rooter = {
        package = vim-rooter;
        setup = ''
          vim.g.rooter_patterns = {'>.config', '.git', '.ozz', 'index.md', '>Documents', '>rPiPico', '>Pico', '=home-manager', 'flake.nix', '*.norg'}
        '';
      };

      tabby = {
        package = tabby-nvim;
        setup = ''
          local theme = {
            fill = "TabLineFill",
            -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
            head = "TabLine",
            current_tab = { fg = "#181825", bg = "#cdd6f4" },
            tab = "TabLine",
            win = { fg = "#181825", bg = "#f5e0dc" },
            tail = "TabLine",
          }
          require("tabby.tabline").set(function(line)
            return {
              {
                { "  ", hl = theme.head },
                line.sep("", theme.head, theme.fill),
              },
              line.tabs().foreach(function(tab)
                local hl = tab.is_current() and theme.current_tab or theme.tab
                return {
                  line.sep("", hl, theme.fill),
                  tab.is_current() and "" or "",
                  tab.number(),
                  tab.close_btn(""),
                  line.sep("", hl, theme.fill),
                  hl = hl,
                  margin = " ",
                }
              end),
            }
          end)
        '';
      };
    };
    # lazy.plugins = {
    #   orgmode-nvim = {
    #     package = "orgmode-nvim";
    #     cmd = ["BufEnter *.org"];
    #   };
    # };
  };
}
