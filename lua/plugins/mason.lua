return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_extend("force", opts.ensure_installed or {}, {
        "pyright",
        "tsserver",
        "lua_ls",
        "rust_analyzer",
        "powershell_es",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = vim.tbl_extend("force", opts.servers or {}, {
        pyright = {},
        tsserver = {},
        lua_ls = {},
        rust_analyzer = {},
        powershell_es = {},
      })
    end,
  },
}
