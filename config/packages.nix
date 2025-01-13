{ pkgs, ... }:
{
  config.vim = {
    extraPackages = with pkgs; [
      ripgrep
      tmux
      nerd-fonts.fira-code
    ];
  };
}
