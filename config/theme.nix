{
  config.vim = {
    dashboard.dashboard-nvim.enable = true;
    theme = {
      enable = true;
      name = "onedark";
      style = "darker";
      transparent = false;
    };

    visuals = {
      nvim-web-devicons = {
        enable = true;
      };
    };

    ui = {
      borders.enable = true;
      colorizer.enable = true;
      # nvim-ufo.enable = true;
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
  };
}
