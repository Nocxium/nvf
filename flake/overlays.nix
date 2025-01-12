{
  pkgs,
  lib,
  ...
}: let
  inherit (lib.nvim) neovimConfigured;

  buildPkg = pkgs: modules: (neovimConfigured {inherit pkgs modules;}).neovim;

  nixConfig = import ../config false;
  maximalConfig = import ../config true;
in {
  flake.overlays.default = _final: prev: {
    inherit neovimConfigured;
    neovim-nix = buildPkg prev [nixConfig];
    neovim-maximal = buildPkg prev [maximalConfig];
    devPkg = buildPkg pkgs [nixConfig {config.vim.languages.html.enable = pkgs.lib.mkForce true;}];
  };
}
