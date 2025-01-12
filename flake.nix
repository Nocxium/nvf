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
      # List of supported systems
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
      ];

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
    in {
      packages = forAllSystems (system: {
        # Default has everything disabled
        default = (mkNeovimConfig system {}).neovim;
        
        # Each specialized build only enables its specific features
        bash = (mkNeovimConfig system { isBash = true; }).neovim;
        java = (mkNeovimConfig system { isJava = true; }).neovim;
        web = (mkNeovimConfig system { isWeb = true; }).neovim;
        python = (mkNeovimConfig system { isPython = true; }).neovim;
        lua = (mkNeovimConfig system { isLua = true; }).neovim;
        
        # Full version with everything enabled
        full = (mkNeovimConfig system {
          isBash = true;
          isJava = true;
          isWeb = true;
          isPython = true;
          isLua = true;
        }).neovim;
      });
    };
}
