vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")

-- load plugins
require("lazy").setup({
	{
		"NvChad/NvChad",
		lazy = false,
		branch = "v2.5",
		import = "nvchad.plugins",
	},

	{ import = "plugins" },
}, lazy_config)

require("oil").setup({
	win_options = {
		signcolumn = "yes:1",
	},
	columns = {
		"icon",
		-- "permissions",
		-- "size",
		-- "mtime",
	},
	delete_to_trash = true,
	skip_confirm_for_simple_edits = true,
	watch_for_changes = true,
	view_options = {
		-- show_hidden = true,
    dir_limit = {
      enabled = true,
      root = vim.fn.getcwd(), -- Set the initial root to the current working directory
    },
	},
  float = {
    -- padding = 3,
    get_win_title = nil,
    preview_split = "right",
  },
	keymaps = {
		["gd"] = function()
			require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
		end,
    ["<C-h>"] = "open_parent",
	},
})

require("oil-git-status").setup({
	show_ignored = true,
})

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("options")
require("nvchad.autocmds")

vim.schedule(function()
	require("mappings")
end)

local wilder = require("wilder")
wilder.setup({ modes = { ":", "/", "?" } })

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "Cursor", timeout = 100 })
	end,
})

require("treesitter-context").setup({
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	multiwindow = false, -- Enable multiwindow support.
	max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
	min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
	line_numbers = true,
	multiline_threshold = 20, -- Maximum number of lines to show for a single context
	trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
	mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
	-- Separator between context and content. Should be a single character string, like '-'.
	-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
	separator = nil,
	zindex = 20, -- The Z-index of the context window
	on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
})

-- Highlight JavaScript and TypeScript variables with a custom color
vim.api.nvim_set_hl(0, "@variable", { fg = "#e3c37e" }) -- For general variables (JavaScript, TypeScript, etc.)
vim.api.nvim_set_hl(0, "@variable.tsx", { fg = "#e3c37e" }) -- Specifically for .tsx files
vim.api.nvim_set_hl(0, "@tag.builtin.tsx", { fg = "#de6b74" })
-- vim.api.nvim_set_hl(0, "@variable.member.tsx", { fg = "#d19a66" })  -- Custom color for .tsx variable members
-- vim.api.nvim_set_hl(0, "@variable.member", { fg = "#d19a66" })  -- Custom color for general variable members
vim.api.nvim_set_hl(0, "@tag.attribute.tsx", { fg = "#d19a66" }) -- Custom color for .tsx tag attributes
-- vim.api.nvim_set_hl(0, "@tag.attribute", { fg = "#d19a66" })

local hl_groups = { 'DiagnosticUnderlineError', 'DiagnosticUnderlineWarn' }
for _, hl in ipairs(hl_groups) do
  vim.cmd.highlight(hl .. ' gui=undercurl')
end

vim.api.nvim_set_hl(0, "@class", { fg = "#de6b74" })  -- Tree-sitter class highlight
vim.api.nvim_set_hl(0, "@type.sass", { fg = "#de6b74" })

vim.api.nvim_set_hl(0, "sassClass", { fg = "#de6b74" })

vim.o.guifont = "JetBrainsMono Nerd Font"

-- require("telescope").setup {
--   extensions = {
--     file_browser = {
--       theme = "ivy",
--       -- disables netrw and use telescope-file-browser in its place
--       hijack_netrw = true,
--       mappings = {
--         ["i"] = {
--           -- your custom insert mode mappings
--         },
--         ["n"] = {
--           -- your custom normal mode mappings
--         },
--       },
--     },
--   },
-- }
--

vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#282a36"})
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })
vim.api.nvim_set_hl(0, "FloatTitle", { fg = "#666c7d", bg = "#1e222a" })

