{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    supportedSystems = ["x86_64-linux" "aarch64-linux"]; # Added aarch64-linux for rPi
    forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems f;

    mkNeovimConfig = {
      # isBash ? false,
      isJava ? false,
      isWeb ? false,
      isPython ? false,
      isLua ? false,
      isCsharp ? false,
      isOrg ? false,
    }: system: let
      pkgs = import nixpkgs {inherit system;};
    in
      inputs.nvf.lib.neovimConfiguration {
        inherit pkgs;
        modules = [
          ./config
          {
            config.vim = {
              languages = {
                # bash.enable = isBash;
                html.enable = isWeb;
                html.treesitter.enable = isWeb;
                ts.enable = isWeb;
                ts.treesitter.enable = isWeb;
                java.enable = isJava;
                java.treesitter.enable = isJava;
                lua.enable = isLua;
                lua.treesitter.enable = isLua;
                python.enable = isPython;
                python.treesitter.enable = isPython;
                csharp.enable = isCsharp;
                csharp.treesitter.enable = isCsharp;
              };
              notes.orgmode.enable = isOrg;
            };
          }
        ];
      };
  in {
    packages = forAllSystems (system: {
      default = (mkNeovimConfig {} system).neovim;
      # bash = (mkNeovimConfig { isBash = true; } system).neovim;
      java = (mkNeovimConfig {isJava = true;} system).neovim;
      web = (mkNeovimConfig {isWeb = true;} system).neovim;
      python = (mkNeovimConfig {isPython = true;} system).neovim;
      lua = (mkNeovimConfig {isLua = true;} system).neovim;
      csharp = (mkNeovimConfig {isCsharp = true;} system).neovim;
      org = (mkNeovimConfig {isOrg = true;} system).neovim;
      full =
        (mkNeovimConfig {
            # isBash = true;
            isJava = true;
            isWeb = true;
            isPython = true;
            isLua = true;
            isCsharp = true;
            isOrg = true;
          }
          system)
        .neovim;
    });
  };
}
