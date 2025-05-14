{isCsharp, ...}: {
  config.vim.languages = {
    # OPTIONS
    enableDAP = true;
    enableFormat = true;
    enableExtraDiagnostics = true;

    #LANGUAGES
    nix = {
      enable = true;
      lsp = {
        server = "nixd";
      };
      format = {
        enable = true;
      };
    };
    bash = {
      enable = true;
      # format.enable = true;
    };
    css = {
      enable = true;
    };

    csharp = {
      lsp.server = "omnisharp";
    };
  };
}
