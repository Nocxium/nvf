{pkgs, ...}: {
  config.vim = {
    extraPlugins = with pkgs.vimPlugins; {
      telescope-undo = {
        package = telescope-undo-nvim;
      };

      telescope-fzf-native = {
        package = telescope-fzf-native-nvim;
      };

      telescope-frecency = {
        package = telescope-frecency-nvim;
        setup = ''
          require("telescope").load_extension "frecency"
        '';
      };
    };

    telescope = {
      enable = true;
      mappings = {
        liveGrep = "<leader>fw";
      };
      setupOpts = {
        defaults = {
          layout_config = {
            horizontal.prompt_position = "top";
          };
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
  };
}
