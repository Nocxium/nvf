{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      mkNeovimConfig = { 
        isBash ? false,
        isJava ? false,
        isWeb ? false,
        isPython ? false,
        isLua ? false 
      }:
        inputs.nvf.lib.neovimConfiguration {
          inherit pkgs;
          modules = [
            ./config
            {
              config.vim = {
                languages = {
                  #LANGUAGES
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
      packages.${system} = {
        # Default has everything disabled
        default = (mkNeovimConfig {}).neovim;
        
        # Each specialized build only enables its specific features
        bash = (mkNeovimConfig { isBash = true; }).neovim;
        java = (mkNeovimConfig { isJava = true; }).neovim;
        web = (mkNeovimConfig { isWeb = true; }).neovim;
        python = (mkNeovimConfig { isPython = true; }).neovim;
        lua = (mkNeovimConfig { isLua = true; }).neovim;
        
        # You could also have a "full" version with everything enabled
        full = (mkNeovimConfig {
          isBash = true;
          isJava = true;
          isWeb = true;
          isPython = true;
          isLua = true;
        }).neovim;
      };
    };
 }
