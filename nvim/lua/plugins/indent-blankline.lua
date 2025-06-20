return {
  'lukas-reineke/indent-blankline.nvim',
  event = 'User FilePost',
  main = 'ibl',
  ---@module "ibl"
  ---@type ibl.config
  opts = {
    indent = {
      char = '┊',
      tab_char = '┊',
    },
    scope = {
      enabled = false,
    },
  },
}
