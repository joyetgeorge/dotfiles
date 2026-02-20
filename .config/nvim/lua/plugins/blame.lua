return {
  "FabijanZulj/blame.nvim",
  keys = {
    { "<leader>gb", "<cmd>BlameToggle<cr>", desc = "Git blame" },
    { "<leader>gB", "<cmd>BlameToggle virtual<cr>", desc = "Git blame (virtual)" },
  },
  opts = {
    date_format = "%r",
    merge_consecutive = true,
    commit_detail_view = "vsplit",
  },
}
