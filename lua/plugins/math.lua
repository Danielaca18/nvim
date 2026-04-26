-- return {
--   {
--     "MeanderingProgrammer/render-markdown.nvim",
--     dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
--     opts = {
--       -- This is the modern equivalent of vim_markdown_math
--       enabled = true,
--       render_modes = { "n", "c", "i", "v" },
--       latex = {
--         enabled = true,
--       },
--     },
--     config = function(_, opts)
--       require("render-markdown").setup(opts)
--       -- The 'Conceal' fix you found earlier
--       vim.opt_local.conceallevel = 2
--     end,
--   },
-- }

return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    -- No dependencies here for a second to simplify
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      -- This is the manual, forced setup
      require("render-markdown").setup({
        log_level = "debug",
        enabled = true,

        render_modes = { "n", "v" },
        anti_conceal = { enabled = false },
        win_options = {
          conceallevel = { default = 2, rendered = 2 },
          -- concealcursor = { default = "nv", rendered = "nv" },
          concealcursor = { default = "", rendered = "" },
        },

        latex = {
          enabled = true,
          render_mode = "inline",
          converter = { "utftex" },
        },
        pipe_table = { enabled = false },
        -- Let's enable signs and icons to PROVE it's working
        heading = {
          enabled = true,
          icons = { "➊ ", "➋ ", "➌ ", "➍ ", "➎ ", "➏ " },
        },
      })
    end,
  },
}
-- return {
--   {
--     "OXY2DEV/markview.nvim",
--     lazy = false,
--     dependencies = {
--       "nvim-treesitter/nvim-treesitter",
--       "echasnovski/mini.icons",
--     },
--     config = function()
--       require("markview").setup({
--         preview = {
--           -- Explicitly set icon provider to mini
--           icon_provider = "mini",
--         },
--         latex = {
--           enable = true,
--           -- This handles the internal mapping of commands like \to and \implies
--           providers = { "internal" },
--           -- Set to inline to replace text directly in the buffer
--           render_mode = "inline",
--         },
--       })
--     end,
--   },
-- }
