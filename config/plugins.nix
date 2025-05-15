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

  nordic-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "nordic-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "AlexvZyl";
      repo = "nordic.nvim";
      rev = "6afe957722fb1b0ec7ca5fbea5a651bcca55f3e1";
      hash = "sha256-NY4kjeq01sMTg1PZeVVa2Vle4KpLwWEv4y34cDQ6JMU=";
    };
  };

  golf = pkgs.vimUtils.buildVimPlugin {
    name = "golf";
    src = pkgs.fetchFromGitHub {
      owner = "vuciv";
      repo = "golf";
      rev = "abf1bc0c1c4a5482b4a4b36b950b49aaa0f39e69";
      hash = "sha256-lCzt+7/uZ/vvWnvWPIqjtS3G3w3qOhI7vHdSQ9bvMKU=";
    };
  };
  # direnv-nvim = pkgs.vimUtils.buildVimPlugin {
  #   name = "direnv-nvim";
  #   src = pkgs.fetchFromGitHub {
  #     owner = "actionshrimp";
  #     repo = "direnv.nvim";
  #     rev = "eec36a38285457c4e5dea2c6856329a9a20bd3a4";
  #     hash = "sha256-7NcVskgAurbIuEVIXxHvXZfYQBOEXLURGzllfVEQKNE=";
  #   };
  # };
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

      nordic-nvim = {
        package = nordic-nvim;
        setup =
          /*
          lua
          */
          ''
            require('nordic').setup({
              cursorline = {
                -- Available styles: 'dark', 'light'.
                theme = 'dark',
              },
              -- on_palette = function(palette)
                 -- palette.black0 = "#14171D"  -- new, darkest tone
                 -- palette.black1 = "#191D24"  -- was black0
                 -- palette.black2 = "#1E222A"  -- was black1
                 -- palette.gray0  = "#222630"  -- was black2
              -- end,
            })
            vim.cmd.colorscheme('nordic')
          '';
      };

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

      golf = {
        package = golf;
      };

      vim-rooter = {
        package = vim-rooter;
        setup = ''
          vim.g.rooter_patterns = {'>.config', '.git', '.ozz', 'index.md', '>Documents', '>rPiPico', '>Pico', '=home-manager', 'flake.nix', '*.norg'}
        '';
      };

      tabby = {
        package = tabby-nvim;
        setup =
          /*
          lua
          */
          ''
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
