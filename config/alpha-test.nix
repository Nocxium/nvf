{pkgs, ...}: let
in {
  config.vim = {
    extraPlugins = with pkgs.vimPlugins; {
      # telescope-zoxide = {
      #   package = telescope-zoxide;
      # };
    };

    # utility.multicursors.enable = true;

    # utility = {
    #   snacks-nvim = {
    #     enable = true;
    #     setupOpts = {
    #       image = {
    #         enabled = true;
    #         force = true;
    #       };
    #     };
    #   };
    # };
    notes = {
      orgmode = {
        enable = true;
        treesitter.enable = true;
      };
    };
    #   neorg = {
    #     enable = true;
    #     treesitter.enable = true;
    #     setupOpts.load = {
    #       "core.defaults".enable = true;
    #       "core.concealer".enable = true;
    #       "core.export".enable = true;
    #     };
    #   };
    # };
  };
}
