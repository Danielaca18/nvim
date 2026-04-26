return {
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = { lspFeatures = { languages = { "r", "python" } } },
  },
  {
    "jmbuhr/otter.nvim",
    opts = {
      buffers = { set_filetype = true },
    },
  },
  {
    "benlubas/molten-nvim",
    build = ":UpdateRemotePlugins",
    init = function()
      vim.g.molten_image_provider = "image.nvim"
    end,
  },
}
