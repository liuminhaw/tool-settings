require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        -- python = { "isort", "black" },
        go = { "gofumpt", "goimports", "golines" },
        -- Use a sub-list to run only the first available formatter
        javascript = { "deno_fmt" },
        markdown = { "deno_fmt" },
        json = { "deno_fmt" },
        html = { "prettier" },
    },
})

vim.keymap.set('n', '<leader>f', ':lua require("conform").format({ bufnr = vim.api.nvim_get_current_buf() })<CR>',
    { noremap = true, silent = true })
