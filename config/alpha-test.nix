{pkgs, ...}: let
  easy-dotnet = pkgs.vimUtils.buildVimPlugin {
    name = "easy-dotnet";
    src = pkgs.fetchFromGitHub {
      owner = "GustavEikaas";
      repo = "easy-dotnet.nvim";
      rev = "50e3d11c16ef80df475e0c92248cdc066bc9fc0a";
      hash = "sha256-HbpgX9GutGYFy7SNZ5+ahynpcycntNXy7pZC+2zuTgM=";
    };
    doCheck = false;
  };
in {
  config.vim = {
    extraPlugins = with pkgs.vimPlugins; {
      # markview = {
      #   package = markview-nvim;
      # };

      easy-dotnet-nvim = {
        package = easy-dotnet;
        setup = ''
          require('easy-dotnet').setup {opts = {}}
        '';
      };
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
    # notes = {
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
