return {
  "gelguy/wilder.nvim",
  event = "CmdlineEnter",
  config = function()
    vim.cmd([[call wilder#setup({'modes': [':', '/', '?']})]])
  end,
}
