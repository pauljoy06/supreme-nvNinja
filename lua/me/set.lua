vim.opt.nu = true
vim.opt.relativenumber = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true  -- Enable incremental search
vim.opt.hlsearch = false   -- Highlight all matches

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@") -- Check usage

vim.opt.updatetime = 100

vim.opt.colorcolumn = "80"

-- For folding 
vim.opt.foldmethod = "indent"
vim.opt.foldnestmax = 16

--Set to to enable emmet
-- vim.opt.timeoutlen = 1000

-- To enable file reload on external change
vim.o.autoread = true

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  pattern = "*",
  command = "checktime",
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
  pattern = "*",
  callback = function()
    vim.notify("File changed on disk. Reloaded!", vim.log.levels.WARN)
  end,
})
