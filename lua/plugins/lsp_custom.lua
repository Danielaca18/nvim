return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        sourcekit = {
          -- 1. Point to your xtool SDK and enable background indexing
          cmd = {
            "sourcekit-lsp",
            "--background-indexing",
            "-Xswiftc",
            "-sdk",
            "-Xswiftc",
            os.getenv("HOME") .. "/.local/share/xtool/sdks/iphoneos.sdk",
          },
          root_dir = function(filename)
            local util = require("lspconfig.util")
            return util.root_pattern(".build", "Package.swift", "xtool.yml", ".git")(filename)
          end,
        },
      },
      -- 2. THE OVERRIDE: This is the only way to force capabilities in LazyVim
      setup = {
        sourcekit = function(_, opts)
          -- Ensure the server is told it MUST support hover
          opts.on_attach = function(client)
            client.server_capabilities.hoverProvider = true
          end
        end,
      },
    },
  },
  -- 3. Treesitter Merging (Keep this for highlighting)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "swift", "commonlisp" })
      end
    end,
  },
}
