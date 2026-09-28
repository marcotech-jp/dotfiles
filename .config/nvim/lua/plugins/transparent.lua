return {
  {
    "xiyaowong/transparent.nvim",
    init = function()
      vim.g.transparent_enabled = true
    end,
    opts = {
      extra_groups = {
        "NormalFloat",
        "FloatBorder",
        "NeoTreeNormal",
        "NeoTreeNormalNC",
        "NeoTreeEndOfBuffer",
      },
    },
  },
}
