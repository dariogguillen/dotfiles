return {
  {
    "nvim-lspconfig",
    opts = {
      diagnostics = {
        -- virtual_text = false,
        update_in_insert = false, -- Don't update diagnostics while typing
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
        },
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.name == "metals" then
            vim.defer_fn(function()
              if not vim.api.nvim_buf_is_valid(args.buf) then
                return
              end
              local filepath = vim.api.nvim_buf_get_name(args.buf)
              if filepath and filepath ~= "" then
                local response = client.request_sync("textDocument/documentSymbol", {
                  textDocument = vim.lsp.util.make_text_document_params(args.buf),
                }, 2000, args.buf)

                if not response or not response.result then
                  vim.notify("Metals might not recognize this file. Try :MetalsReindex", vim.log.levels.WARN)
                end
              end
            end, 3000)
          end
        end,
      })
    end,
  },
}
