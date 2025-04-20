{
  config.vim = {
    keymaps = [
      # Telescope
      {
        mode = ["n"];
        key = "<leader>fe";
        action = ":Telescope file_browser<CR>";
        desc = "File Browser";
        silent = true;
      }
      {
        mode = ["n"];
        key = "<leader>fr";
        action = ":Telescope oldfiles<CR>";
        silent = true;
        desc = "File Browser";
      }

      # Small plugins
      {
        mode = ["n" "v"];
        key = "s";
        lua = true;
        action = "require('flash').jump";
        silent = true;
        desc = "Jump to word";
      }
      {
        mode = ["n"];
        key = "<leader>gg";
        action = ":Neogit<CR>";
        silent = true;
        desc = "Open Neogit";
      }
      {
        mode = ["n"];
        key = "<leader>fr";
        action = ":Telescope oldfiles<CR>";
        silent = true;
        desc = "File Browser";
      }
      # {mode = ["n"];  key = "<leader>fc";  action = "MiniFiles.open";  silent = true; lua = true;  desc = "File Browser";}

      # Navigation
      {
        mode = ["n"];
        key = "§";
        action = ":tabnext<CR>";
        silent = true;
        desc = "Next tab";
      }
      {
        mode = ["n"];
        key = "½";
        action = ":tabprev<CR>";
        silent = true;
        desc = "Previous tab";
      }
      {
        mode = ["n"];
        key = "<leader>§";
        action = ":tabnew<CR>";
        silent = true;
        desc = "New tab";
      }
      {
        mode = ["n" "v"];
        key = "<C-d>";
        action = "<C-d>zz";
        silent = true;
        desc = "center after C-d";
      }
      {
        mode = ["n" "v"];
        key = "<C-u>";
        action = "<C-u>zz";
        silent = true;
        desc = "center after C-u";
      }
      {
        mode = ["n" "v"];
        key = "<C-e>";
        action = "<C-u>zz";
        silent = true;
        desc = "center after C-e";
      }
      {
        mode = ["n"];
        key = "H";
        action = "^";
        silent = true;
        desc = "Go to beginning of line";
      }
      {
        mode = ["n"];
        key = "L";
        action = "$";
        silent = true;
        desc = "Go to end of line";
      }

      {
        mode = ["n"];
        key = "<leader>o";
        action = ":Oil<CR>";
        silent = true;
        desc = "Open Oil";
      }

      {
        mode = ["n"];
        key = "j";
        action = "gj";
        silent = true;
      }
      {
        mode = ["n"];
        key = "k";
        action = "gk";
        silent = true;
      }

      {
        mode = ["v"];
        key = "<";
        action = "<gv";
        silent = true;
        desc = "Indent backward";
      }
      {
        mode = ["v"];
        key = ">";
        action = ">gv";
        silent = true;
        desc = "Indent forward";
      }
      {
        mode = ["n"];
        key = "<";
        action = "<<";
        silent = true;
        desc = "Indent backward";
      }
      {
        mode = ["n"];
        key = ">";
        action = ">>";
        silent = true;
        desc = "Indent forward";
      }

      {
        mode = ["v"];
        key = "<A-j>";
        action = ":m '>+1<CR>gv=gv";
        silent = true;
        desc = "Move the line up";
      }
      {
        mode = ["v"];
        key = "<A-k>";
        action = ":m '<-2<CR>gv=gv";
        silent = true;
        desc = "Move the line down";
      }

      {
        mode = ["v"];
        key = "p";
        action = ''"_dP'';
        silent = true;
        desc = "Better Paste";
      }

      # Harpoon
      {
        mode = ["n"];
        key = "ª";
        action = ":lua require('harpoon.ui').nav_file(1)<CR>";
        silent = true;
        desc = "Harpoon 1";
      }
      {
        mode = ["n"];
        key = "ß";
        action = ":lua require('harpoon.ui').nav_file(2)<CR>";
        silent = true;
        desc = "Harpoon 2";
      }
      {
        mode = ["n"];
        key = "ð";
        action = ":lua require('harpoon.ui').nav_file(3)<CR>";
        silent = true;
        desc = "Harpoon 3";
      }
      {
        mode = ["n"];
        key = "đ";
        action = ":lua require('harpoon.ui').nav_file(4)<CR>";
        silent = true;
        desc = "Harpoon 4";
      }
      {
        mode = ["n"];
        key = "σ";
        action = ":lua require('harpoon.mark').add_file()<CR>";
        silent = true;
        desc = "Add to harpoon";
      }
      {
        mode = ["n"];
        key = "µ";
        action = ":lua require('harpoon.ui').toggle_quick_menu()<CR>";
        silent = true;
        desc = "View Harpoon";
      }
    ];
  };
}
