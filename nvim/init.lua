-- tab settings
local set = vim.opt 
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.autoindent = true
set.copyindent = true

require('plugins')
require('file-explorer')
require('mason-config')
require('gopls')
require('bash-language-server')
require('yaml-ls')
require('code-completion')
require('custom-keys')
require('linter')
require('debugging')
require('styling')
require('file-finder')
require('syntax-highlight')
require('statusbar')
require('autopairs')

