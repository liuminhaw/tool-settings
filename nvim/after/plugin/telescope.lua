local builtin = require("telescope.builtin")
-- vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>pf", function()
    builtin.find_files({ hidden = true })
end)
-- vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<C-p>", function()
    builtin.git_files({ hidden = true })
end)
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > "), additional_args = { "--hidden" } })
end)
-- vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
--
require("telescope").setup({
	defaults = {
		file_ignore_patterns = {
			"node_modules",
		},
	},
})
