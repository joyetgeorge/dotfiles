return {
  "nvim-pack/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Spectre",
  keys = {
    { "<leader>S", function() require("spectre").toggle() end, desc = "Toggle Spectre" },
    { "<leader>sw", function() require("spectre").open_visual({ select_word = true }) end, desc = "Search current word" },
    { "<leader>sw", mode = "v", function() require("spectre").open_visual() end, desc = "Search current selection" },
    { "<leader>sp", function() require("spectre").open_file_search({ select_word = true }) end, desc = "Search in current file" },
  },
  opts = {
    open_cmd = "noswapfile vnew",
  },
}
