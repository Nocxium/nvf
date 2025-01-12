
{ pkgs, ... }:

let
  tmux-status = pkgs.vimUtils.buildVimPlugin {
    name = "tmux-status";
    src = pkgs.fetchFromGitHub {
      owner = "christopher-francisco";
      repo = "tmux-status.nvim";
      rev = "18268e1044eff72dab201069204b402ee4d09bda";
      hash = "sha256-1qGvLaKgRA0CXldx5k+/3y3Q4ypGs1CwcAPfoenxod8=";
    };
  };
in
{
  config.vim = {
    extraPlugins = with pkgs.vimPlugins; {
      tmux-status = {
        package = tmux-status;
        setup = ''
          require('tmux-status').setup {opts = {}}
        '';
      };
    };
  };
}

