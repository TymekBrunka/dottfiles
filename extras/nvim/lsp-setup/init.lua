local M = {}

function M.setup()
	require("neodev").setup({
  		library = {
  		  enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
  		  -- these settings will be used for your Neovim config directory
  		  runtime = true, -- runtime path
  		  types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
  		  plugins = true, -- installed opt or start plugins in packpath
  		  -- you can also specify the list of plugins to make available as a workspace library
  		  -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
  		},
  		setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
  		-- for your Neovim config directory, the config.library settings will be used as is
  		-- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
  		-- for any other directory, config.library.enabled will be set to false
  		override = function(root_dir, options) end,
  		-- With lspconfig, Neodev will automatically setup your lua-language-server
  		-- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
  		-- in your lsp start options
  		lspconfig = true,
  		-- much faster, but needs a recent built of lua-language-server
  		-- needs lua-language-server >= 3.6.0
  		pathStrict = true,
	})

    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" , "rust_analyzer" }
    })

    local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    require("lspconfig").lua_ls.setup {
		settings = {
			Lua = {
	    		completion = {
	    			callSnippet = "Replace"
	    		}
	    	}
		},

        on_attach = on_attach,
        capabilities = capabilities
    }

    require("lspconfig").rust_analyzer.setup {
        on_attach = on_attach,
        capabilities = capabilities
    }

	require("lspconfig").bashls.setup {
		on_attach = on_attach,
		capabilities = capabilities
	}
end

return M
