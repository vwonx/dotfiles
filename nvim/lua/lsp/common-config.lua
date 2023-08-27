local M = {}

M.key_attach = function(bufnr)
  vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Goto Declaration" })
  vim.keymap.set("n", "gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end,
    { buffer = bufnr, desc = "Goto Definition" })
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover" })
  vim.keymap.set("n", "gI", function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end,
    { buffer = bufnr, desc = "Goto Implementation" })
  vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature Help" })
  vim.keymap.set("n", "gy", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end,
    { buffer = bufnr, desc = "Goto T[y]pe Definition" })
  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Action" })
  vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { buffer = bufnr, desc = "References" })
  vim.keymap.set("n", "<leader>cf", function()
    vim.lsp.buf.format { async = true }
  end, { buffer = bufnr, desc = "Code Formatting" })
end

M.disable_format = function(client)
  if vim.fn.has("nvim-0.8") == 1 then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  else
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
end

M.navic_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  end
end

M.capabilities = require('cmp_nvim_lsp').default_capabilities()

return M
