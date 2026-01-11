require "nvchad.autocmds"

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- -- Quit Neovim when closing the last buffer
-- vim.api.nvim_create_autocmd("BufDelete", {
--   callback = function()
--     -- Schedule to run after buffer is actually deleted
--     vim.schedule(function()
--       -- Get list of listed buffers
--       local bufs = vim.tbl_filter(function(b)
--         return vim.bo[b].buflisted and vim.api.nvim_buf_is_valid(b)
--       end, vim.api.nvim_list_bufs())
      
--       -- If no listed buffers remain, quit
--       if #bufs == 0 then
--         vim.cmd("qa")
--       end
--     end)
--   end,
-- })
