require 'cmp'.setup {
	sources = {
		{ name = 'nvim_lsp' }
	}
}

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()


require 'lspconfig'.jedi_language_server.setup {
	capabilities = capabilities,
	vim.diagnostic.config({
		virtual_text = false,
	})
}

-- require 'lspconfig'.pyright.setup {
-- 	capabilities = capabilities,
-- 	vim.diagnostic.config({
-- 		virtual_text = false,
-- 	})
-- }

require 'lspconfig'.sumneko_lua.setup {
	capabilities = capabilities,
	vim.diagnostic.config({
		virtual_text = false,
	}),
	settings = {
		Lua = {
		diagnostics = {
			globals = {"vim"},
		},
	},
},
}

