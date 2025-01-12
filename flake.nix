{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nvf.url = "github:notashelf/nvf";
  };
  outputs = { self, nixpkgs, ... } @ inputs:
    let
      # Define supported architectures
      supportedSystems = [ "x86_64-linux" ];
      allSystems = [ "x86_64-linux" "aarch64-linux" ];

      # Helper function to generate attributes for each system
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      forAllArchs = nixpkgs.lib.genAttrs allSystems;

      # Function to get pkgs for a specific system
      pkgsFor = system: import nixpkgs { system = system; };

      # Neovim configuration function
      mkNeovimConfig = system: { 
        isBash ? false,
        isJava ? false,
        isWeb ? false,
        isPython ? false,
        isLua ? false 
      }: inputs.nvf.lib.neovimConfiguration {
        pkgs = pkgsFor system;
        modules = [
          ./config
          {
            config.vim.languages = {
              bash.enable = isBash;
              css.enable = isWeb;
              html.enable = isWeb;
              java.enable = isJava;
              lua.enable = isLua;
              python.enable = isPython;
            };
          }
        ];
      };

      # Function to create a basic Neovim configuration for unsupported systems
      mkBasicNeovim = system:
        let pkgs = pkgsFor system; in
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
      # Packages for all architectures
      packages = forAllArchs (system:
        if system == "x86_64-linux" then {
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
        } else {
          default = mkBasicNeovim system;  # Default package for `nix run`
          rPi = mkBasicNeovim system;      # Explicit rPi package
        }
      );
    };
}
