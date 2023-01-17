-- fetch keymap function
local map = vim.api.nvim_set_keymap

-- update leader key to ,
vim.g.mapleader = ","

-- map the key n to run the command :NvimTreeToggle
map('n', '<C-n>', [[:NvimTreeToggle<CR>]], {}) 

-- CTRL+s to save the file
map('n', '<C-s>', [[:w<CR>]], {})

-- nvim-dap keymappings
-- Press f5 to debug
map('n', '<F5>', [[:lua require'dap'.continue()<CR>]], {})
-- Press CTRL + b to toggle regular breakpoint
map('n', '<C-b>', [[:lua require'dap'.toggle_breakpoint()<CR>]], {})
-- Press CTRL + c to toggle Breakpoint with Condition
map('n', '<C-c>', [[:lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>]], {})
-- Press CTRL + l to toggle Logpoint
map('n', '<C-l>', [[:lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log Point Msg: '))<CR>]], {})
-- Pressing F10 to step over
map('n', '<F10>', [[:lua require'dap'.step_over()<CR>]], {})
-- Pressing F11 to step into
map('n', '<F11>', [[:lua require'dap'.step_into()<CR>]], {})
-- Pressing F12 to step out
map('n', '<F12>', [[:lua require'dap'.step_out()<CR>]], {})
-- Press F6 to open REPL
map('n', '<F6>', [[:lua require'dap'.repl.open()<CR>]], {})
-- Press dl to run last ran configuration (if you used f5 before it will re run it etc)
map('n', 'dl', [[:lua require'dap'.run_last()<CR>]], {})

-- Press Ctrl+d to toggle debug mode, will remove NvimTree also
map('n', '<C-d>', [[:NvimTreeToggle<CR> :lua require'dapui'.toggle()<CR>]], {})

-- Floatterm Settings
--map('n', "<leader>fnt", ":FloatermNew --name=floatTerm --height=0.85 --width=0.8 --autoclose=1 bash <CR> ", {})
map('n', "<leader>nt", ":FloatermNew --name=InteractiveTerm --height=0.85 --width=0.8 --autoclose=1 bash <CR> ", {})
map('n', "<leader>ft", ":FloatermShow InteractiveTerm<CR>",{})
map('t', "<leader>nt", "<C-\\><C-n>:FloatermNew --name=InteractiveTerm --height=0.85 --width=0.8 --autoclose=1 bash <CR> ", {})
map('t', "<leader>ftk", "<C-\\><C-n>:FloatermKill<CR>",{})
map('t', "<leader>ftn", "<C-\\><C-n>:FloatermNext<CR>",{})
map('t', "<leader>ftp", "<C-\\><C-n>:FloatermPrev<CR>",{})
map('t', "<leader><Esc>", "<C-\\><C-n>:q<CR>",{})
