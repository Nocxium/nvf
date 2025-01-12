{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nvf.url = "github:notashelf/nvf";
  };
  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs:
    let
      # Only include x86_64-linux since nvf doesn't support aarch64
      supportedSystems = [ "x86_64-linux" ];

      # Helper function to generate attributes for each system
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      # Function to get pkgs for a specific system
      pkgsFor = system: nixpkgs.legacyPackages.${system};

      # Neovim configuration function
      mkNeovimConfig = system: { 
        isBash ? false,
        isJava ? false,
        isWeb ? false,
        isPython ? false,
        isLua ? false 
      }:
        inputs.nvf.lib.neovimConfiguration {
          pkgs = pkgsFor system;
          modules = [
            ./config
            {
              config.vim = {
                languages = {
                  bash.enable = isBash;
                  css.enable = isWeb;
                  html.enable = isWeb;
                  java.enable = isJava;
                  lua.enable = isLua;
                  python.enable = isPython;
                };
              };
            }
          ];
        };

      # Function to create a basic Neovim configuration for unsupported systems
      mkBasicNeovim = system:
        let
          pkgs = pkgsFor system;
        in
        pkgs.neovim.override {
          configure = {
            customRC = ''
              " Basic Neovim configuration for unsupported systems
              set number
              set relativenumber
              set expandtab
              set tabstop=2
              set shiftwidth=2
              set smartindent
              set termguicolors
            '';
          };
        };
    in {
      # Packages for supported systems (x86_64-linux)
      packages = forAllSystems (system: {
        default = (mkNeovimConfig system {}).neovim;
        bash = (mkNeovimConfig system { isBash = true; }).neovim;
        java = (mkNeovimConfig system { isJava = true; }).neovim;
        web = (mkNeovimConfig system { isWeb = true; }).neovim;
        python = (mkNeovimConfig system { isPython = true; }).neovim;
        lua = (mkNeovimConfig system { isLua = true; }).neovim;
        full = (mkNeovimConfig system {
          isBash = true;
          isJava = true;
          isWeb = true;
          isPython = true;
          isLua = true;
        }).neovim;
      }) // {
        # Basic Neovim configuration for aarch64-linux
        "aarch64-linux" = {
          rPi = mkBasicNeovim "aarch64-linux";
        };
      };
    };
}
