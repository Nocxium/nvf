{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = { self, nixpkgs, ... } @ inputs:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" ]; # Added aarch64-linux for rPi
      forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems f;

      mkNeovimConfig = { 
        isBash ? false,
        isJava ? false,
        isWeb ? false,
        isPython ? false,
        isLua ? false
      }: system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        inputs.nvf.lib.neovimConfiguration {
          inherit pkgs;
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
        default = (mkNeovimConfig {} system).neovim;
        bash = (mkNeovimConfig { isBash = true; } system).neovim;
        java = (mkNeovimConfig { isJava = true; } system).neovim;
        web = (mkNeovimConfig { isWeb = true; } system).neovim;
        python = (mkNeovimConfig { isPython = true; } system).neovim;
        lua = (mkNeovimConfig { isLua = true; } system).neovim;
        full = (mkNeovimConfig {
          isBash = true;
          isJava = true;
          isWeb = true;
          isPython = true;
          isLua = true;
        } system).neovim;

        # Raspberry Pi specific package
        rPi = (mkNeovimConfig {
          isBash = true;
          isJava = true;
          isWeb = true;
          isPython = true;
          isLua = true;
        } "aarch64-linux").neovim;
      });
    };
}
