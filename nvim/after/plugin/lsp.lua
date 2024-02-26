local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        "bashls",
        "gofumpt",
        "goimports",
        "golines",
        "gopls",
        "html",
        "jq",
        "lua_ls",
        "prettier",
        "tsserver",
    },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            --- in this function you can setup
            --- the language server however you want.
            --- in this example we just use lspconfig

            require('lspconfig').lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = { 'vim' },
                        },
                    }
                }
            })
        end,
    },
})
