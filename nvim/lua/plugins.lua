return require('packer').startup(function(use)
	-- Configuration is going here
	use 'wbthomason/packer.nvim'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason.lspconfig.nvim'
	use 'neovim/nvim-lspconfig'

        -- Plugins for code completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'

    -- Nvimtree for file exploring
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons' -- optional, for file icons
        },
	    tag = 'nightly' -- optional, updated every week.
    }

	-- DAP for debugging
 	use 'mfussenegger/nvim-dap'
	-- UI for DAP
 	use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

	-- Theme setup
	use 'projekt0n/github-nvim-theme'

	-- Treesitter (Provide better highlighting in code)
 	use {
 		-- recommended packer way of installing it is to run this function, copied from documentation
 	    'nvim-treesitter/nvim-treesitter',
 	    run = function()
		local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
 	        end,
 	}

	-- Telescope used to fuzzy search files
	use {
    	'nvim-telescope/telescope.nvim',
    	requires = {'nvim-lua/plenary.nvim'} 
 	}

	-- Lualine information / Status bar
 	use {
    	'nvim-lualine/lualine.nvim',
    	requires = { 'kyazdani42/nvim-web-devicons', opt = true }
 	}

	-- autopairs bracket
	use { 
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}

	-- floatTerm
	use 'voldikss/vim-floaterm'

	-- markdown preview
	use 'iamcco/markdown-preview.nvim'

	-- linter
	use {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("null-ls").setup()
        end,
        requires = { "nvim-lua/plenary.nvim" },
    }

    use "lukas-reineke/indent-blankline.nvim"

end)
