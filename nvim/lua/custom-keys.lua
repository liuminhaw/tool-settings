-- fetch keymap function
local map = vim.api.nvim_set_keymap

-- map the key n to run the command :NvimTreeToggle
map('n', 'n', [[:NvimTreeToggle<CR>]], {}) 

-- CTRL+s to save the file
map('n', '<C-s>', [[:w<CR>]], {})

