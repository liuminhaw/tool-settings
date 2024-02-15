local plugins = {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "golines",
        "goimports",
        "gofumpt",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    ft = "go",
    opts = function()
      return require "custom.configs.none-ls"
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "github/copilot.vim",
    lazy = false,
    -- vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
    --   expr = true,
    --   replace_keycodes = false
    -- }),

    config = function()  -- Mapping tab is already used by NvChad
      vim.g.copilot_no_tab_map = true;
      vim.g.copilot_assume_mapped = true;
      -- vim.g.copilot_tab_fallback = "";
     -- The mapping is set to other key, see custom/lua/mappings
     -- or run <leader>ch to see copilot mapping section
    end
  },
}
return plugins
