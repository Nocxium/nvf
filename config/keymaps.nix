{
  config.vim = {
    keymaps = [
      {
        key = "<leader>fe";
        mode = ["n"];
        action = ":Telescope file_browser<CR>";
        silent = true;
        desc = "File Browser";
      }
      {
        key = "<leader>fr";
        mode = ["n"];
        action = ":Telescope oldfiles<CR>";
        silent = true;
        desc = "File Browser";
      }
      {
        key = "s";
        mode = ["n" ];
        action = ":lua require('flash').jump()<CR>";
        silent = true;
        desc = "Jump to word";
      }
      {
        key = "<C-d>";
        mode = ["n" "v"];
        action = "<C-d>zz";
        silent = true;
        desc = "center after C-d";
      }
      {
        key = "<C-u>";
        mode = ["n" "v" ];
        action = "<C-u>zz";
        silent = true;
        desc = "center after C-u";
      }
      {
        key = "<C-e>";
        mode = ["n" "v"];
        action = "<C-u>zz";
        silent = true;
        desc = "center after C-e";
      }
      {
        key = "<leader>gg";
        mode = ["n" ];
        action = ":Neogit<CR>";
        silent = true;
        desc = "Open Neogit";
      }
      {
        key = "§";
        mode = ["n" ];
        action = ":tabnext<CR>";
        silent = true;
        desc = "Next tab";
      }
      {
        key = "½";
        mode = ["n" ];
        action = ":tabprev<CR>";
        silent = true;
        desc = "Previous tab";
      }
      {
        key = "<leader>§";
        mode = ["n" ];
        action = ":tabnew<CR>";
        silent = true;
        desc = "New tab";
      }
    ];
  };
}
