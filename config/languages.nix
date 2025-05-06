{
  config.vim.languages = {
    # OPTIONS
    enableDAP = true;
    enableFormat = true;

    #LANGUAGES
    nix = {
      enable = true;
      extraDiagnostics.enable = true;
      lsp = {
        server = "nixd";
      };
      format = {
        enable = true;
      };
    };
    bash = {
      enable = true;
      extraDiagnostics.enable = true;
      # format.enable = true;
    };
    css = {
      enable = true;
    };

    rust = {
      enable = true;
      crates = {
        enable = true;
        codeActions = true;
      };
    };
  };
}
