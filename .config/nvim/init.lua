vim.g.mapleader = " "
--[ Lazy.nvim ]
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
      vim.fn.system({
	"git",
	"clone",
	"--filter=blob:none",
	"https://github.com/folke/lazy.nvim.git",
	"--branch=stable", -- latest stable release
	lazypath,
      })
    end
    vim.opt.rtp:prepend(lazypath)
--[ lazy.nvim ]

--require("lazy").setup({
--  "folke/which-key.nvim"
--})

require("plugins").setup()

vim.cmd("set relativenumber splitright splitbelow")
vim.cmd("colorscheme catppuccin-frappe")
-- vim.cmd("hi Normal ctermbg=NONE guibg=NONE")
vim.cmd("set shiftwidth=4 smarttab tabstop=4")

vim.keymap.set("n", "<leader>e", function()
    vim.cmd("Neotree toggle")
end, {})

-- vim.keymap.set("i", "<C-s>", "<CR>:w<CR>i", {})

vim.keymap.set("n", "<leader>nm", function()
	vim.cmd('if buffer_number("~/note.md") != -1 \
		if bufwinid("~/note.md") == -1 \
			vsp \
			buffer ~/note.md \
		endif \
	else \
		vsp ~/note.md \
	endif')
end, {})

vim.opt.termguicolors = true
local tgc = true

vim.keymap.set("n", "<leader>tgc", function()
	if tgc then
		vim.opt.termguicolors = false
		tgc = false
	else
		vim.opt.termguicolors = true
		tgc = true
	end
end, {})
