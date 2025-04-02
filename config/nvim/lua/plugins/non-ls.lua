return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local cspell = require('cspell')
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.black,
        cspell.diagnostics,
        cspell.code_actions,
      },
    })
    vim.keymap.set("n", "fm", vim.lsp.buf.format, {})
  end,
  opts = function(_, opts)
    local cspell = require("cspell")
    opts.sources = opts.sources or {}
    table.insert(
      opts.sources,
      cspell.diagnostics.with({
        diagnostics_postprocess = function(diagnostic)
          diagnostic.severity = vim.diagnostic.severity.HINT
        end,
      })
    )
    table.insert(opts.sources, cspell.code_actions)
  end,

}
