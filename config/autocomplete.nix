{
  config.vim = {
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

    snippets.luasnip.enable = true;
    autopairs.nvim-autopairs.enable = true;
  };
}
