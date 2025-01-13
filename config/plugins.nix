{ pkgs, ... }:

let
  tmux-status = pkgs.vimUtils.buildVimPlugin {
    name = "tmux-status";
    src = pkgs.fetchFromGitHub {
      owner = "christopher-francisco";
      repo = "tmux-status.nvim";
      rev = "18268e1044eff72dab201069204b402ee4d09bda";
      hash = "sha256-1qGvLaKgRA0CXldx5k+/3y3Q4ypGs1CwcAPfoenxod8=";
    };
  };
in
{
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

      # auto-session = {
      #   package = auto-session;
      #   setup = "require('auto-session').setup {}";
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
            vim.g.rooter_patterns = {'>.config', '.git', '.ozz', 'index.md', '>Documents', '>rPiPico', '>Pico', '>dotfiles', '=home-manager', '=nixos', '*.norg'}
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
  };
}
