-- colour scheme
--vim.cmd("source $HOME/.config/nvim/colors/root-loops.vim")

-- wayland clipboard
-- set clipboard=unnamed

-- Define clipboard configuration
vim.opt.clipboard = "unnamedplus"

-- Perplexity thinks this should be enabled by default. Uncomment if it is wrong
--vim.g.clipboard = {
--  name = "wl-clipboard",
--  copy = {
--    ["+"] = "wl-copy --type text/plain",
--    ["*"] = "wl-copy --type text/plain",
--  },
--  paste = {
--    ["+"] = "wl-paste --type text/plain",
--    ["*"] = "wl-paste --type text/plain",
--  },
--  cache_enabled = true,
--}

-- Copy/paste over SSH
if os.getenv("SSH_TTY") then
  vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
      ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste = {
      ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
      ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
    },
  }
end

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

require("config.lazy")
