-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- ambiwidth=doubleはLazyVimのfold等アイコン(Nerd Font, Private Use Area)が
-- 東アジア"曖昧"幅の文字として扱われてしまい、fillcharsのE835/E1512と衝突するため
-- Neovimでは設定しない (.vimrc側のVim専用設定として維持)

opt.showmatch = true -- 対応する括弧を強調表示
opt.swapfile = false -- スワップファイルを作成しない
opt.title = true -- タイトルを表示
opt.nrformats = "" -- すべての数を10進数として扱う
opt.whichwrap = "b,s,h,l,<,>,[,],~" -- 行をまたいで移動
