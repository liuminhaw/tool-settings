-- Require LSP configuration from the plugin so we can attach GOPLS to it
lspconfig = require "lspconfig"
util = require "lspconfig/util"

lspconfig.gopls.setup {
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod" },
	root_dir = util.root_pattern{ "go.work", "go.mod", ".git" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}

-- function go_org_imports()
--     local params = vim.lsp.util.make_range_params()
--     params.context = {only = {"source.organizeImports"}}
--     local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 5000)
--     for cid, res in pairs(result or {}) do
--         for _, r in pairs(res.result or {}) do
--           if r.edit then
--             local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
--             vim.lsp.util.apply_workspace_edit(r.edit, enc)
--           end
--         end
--     end 
-- end
function go_org_imports()
  local clients = vim.lsp.buf_get_clients()
  for _, client in pairs(clients) do

    local params = vim.lsp.util.make_range_params(nil, client.offset_encoding)
    params.context = {only = {"source.organizeImports"}}

    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 5000)
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit, client.offset_encoding)
        else
          vim.lsp.buf.execute_command(r.command)
        end
      end
    end
  end
end


vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.go" },
  callback = vim.lsp.buf.format,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.go" },
  callback = go_org_imports,
})

