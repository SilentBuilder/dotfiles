local on_attach = function(_, bufnr)
  local nmap = function(keys, func)
    vim.keymap.set('n', keys, func, { buffer = bufnr })
  end

  nmap('<leader>ca', vim.lsp.buf.code_action)

  nmap('gd', vim.lsp.buf.definition)
  nmap('gr', require('telescope.builtin').lsp_references)
  nmap('gI', vim.lsp.buf.implementation)
  nmap('gD', vim.lsp.buf.type_definition)
  nmap('<leader>gq', require('telescope.builtin').lsp_dynamic_workspace_symbols)

  nmap('<F2>', vim.lsp.buf.rename)

  nmap('K', vim.lsp.buf.hover)
  nmap('<leader>d', vim.diagnostic.open_float)

  nmap('gD', vim.lsp.buf.declaration)
end

local servers = {
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
  tailwindcss = {
    filetypes = tailwindfiles,
  },
}

require('neodev').setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local mason_lspconfig = require 'mason-lspconfig'
mason_lspconfig.setup {
  ensure_installed = {
    'html',
    'htmx',
  },
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}

require('mason-null-ls').setup {
  ensure_installed = {},
  automatic_installation = false,
  handlers = {},
}
require('null-ls').setup {
  sources = {},
}

local lspconfig = require 'lspconfig'

lspconfig.ocamllsp.setup {
  on_attach = on_attach,
}
lspconfig.hls.setup {
  on_attach = on_attach,
}
lspconfig.zls.setup {
  on_attach = on_attach,
  settings = {
    zls = {
      enable_autofix = false,
      warn_style = true,
      enable_build_on_save = true,
    },
  },
}
lspconfig.gleam.setup {
  on_attach = on_attach,
}

vim.filetype.add { extension = { templ = 'templ' } }

lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'html', 'templ' },
}
lspconfig.htmx.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'html', 'templ' },
}
