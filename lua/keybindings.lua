--[[ 
--快捷键配置--

快捷键设置，规则如下
vim.api.nvim_set_keymap() 全局快捷键
vim.api.nvim_buf_set_keymap() Buffer 快捷键

配置格式
vim.api.nvim_set_keymap('模式', '按键', '映射为', 'options')

'模式'说明
n -> Normal 模式
i -> Insert 模式
v -> Visual 模式
t -> Terminal 模式
c -> Command 模式

'按键'和'映射' 是要按下的键

'options' 默认
{ noremap = true, silent = true }
--]] 
-- 前缀键
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- 设置本地变量 
local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = {noremap = true, silent = true }
-- 普通模式q直接退出
--map("n", "q", ":q<CR>", opt)
-- 普通模式wq保存退出
--map("n", "wq", ":wq<CR>", opt)

-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opt)
map("n", "<leader>z", ":NvimTreeFindFile<CR>", opt)
-- bufferline
-- 关闭
-- 左右Tab切换
map("n", "<leader>h", ":BufferLineCyclePrev<CR>", opt)
map("n", "<leader>l", ":BufferLineCycleNext<CR>", opt)

-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  -- 分屏打开文件
  { key = "v", action = "vsplit" },
  { key = "h", action = "split" },
  -- 显示隐藏文件
  { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
  { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  -- 文件操作
  { key = "<F5>", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "s", action = "system_open" },
}
return pluginKeys

