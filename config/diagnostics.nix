{pkgs, ...}: {
  config.vim = {
    extraPlugins = with pkgs.vimPlugins; {
      tiny-inline-diagnostic-nvim = {
        package = tiny-inline-diagnostic-nvim;
        setup = ''
          require('tiny-inline-diagnostic').setup()
        '';
      };
    };
  };
}
