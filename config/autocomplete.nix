{
  # test
  config.vim = {
    snippets.luasnip.enable = true;
    autopairs.nvim-autopairs.enable = true;

    autocomplete.nvim-cmp = {
      enable = true;
      sourcePlugins = [
        "cmp-path"
      ];
      sources = {
        buffer = "[Buffer]";
        path = "[Path]";
      };
      setupOpts.sorting.comparators = [
        {
          _type = "lua-inline";
          expr = "deprio(kinds.Text)";
        }
        "exact"
        "score"
        "kind"
        "length"
        "sort_text"
        "offset"
      ];
    };

    # autocomplete.blink-cmp = {
    #   enable = true;
    #   friendly-snippets.enable = true;
    #   sourcePlugins = {
    #     ripgrep.enable = true;
    #   };
    #   setupOpts = {
    #     sources = {
    #       default = [
    #         "lsp"
    #         "path"
    #         "snippets"
    #         "buffer"
    #       ];
    #     };
    #   };
    # };
  };
}
