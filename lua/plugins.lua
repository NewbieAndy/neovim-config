-- https://github.com/folke/lazy.nvim#-migration-guide
-- 引导lazy插件
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
--[[
--设置插件的方式
require("lazy").setup(plugins, opts)
--]]

require("lazy").setup({
  {"folke/which-key.nvim",
  config = function()
    vim.o.timeout =true
    vim.o.timeoutlen = 300
    require("which-key").setup(
    )
  end,
  },
  --主题
  "folke/tokyonight.nvim",
  --左侧边栏
  {"nvim-tree/nvim-tree.lua", dependencies = "nvim-tree/nvim-web-devicons"}
  --BufferLine
  --{"akinsho/bufferline.nvim", dependencies = {"kyazdani42/nvim-web-devicons","moll/vim-bbye"}},
  --github copilot
  --"github/copilot.vim",
  --{'Exafunction/codeium.vim', event = 'BufEnter'},
  --{'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons'}}

})

