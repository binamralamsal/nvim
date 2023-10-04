local mason_lspconfig = require 'mason-lspconfig'

local on_attach = function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set('<leader>rn', vim.lsp.buf.rename, opts)
	vim.keymap.set('<leader>ca', vim.lsp.buf.code_action, opts)

	vim.keymap.set('gd', vim.lsp.buf.definition, opts)
	vim.keymap.set('<leader>D', vim.lsp.buf.type_definition, opts)

	vim.keymap.set('K', vim.lsp.buf.hover, opts)
	vim.keymap.set('<C-k>', vim.lsp.buf.signature_help, opts)
	vim.keymap.set('gD', vim.lsp.buf.declaration, opts)

	vim.keymap.set('<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
	vim.keymap.set('<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
	vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)

	vim.keymap.set("n", "<leader>f", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]", function() vim.diagnostic.goto_prev() end, opts)

end

local servers = {
  tsserver = {},
  html = { filetypes = { 'html', 'twig', 'hbs'} },
  lua_ls = {},
  eslint = {}
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end
}

