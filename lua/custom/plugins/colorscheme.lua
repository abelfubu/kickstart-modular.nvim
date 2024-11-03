return {
  {
    'catppuccin/nvim',
    priority = 1000,
    init = function()
      require('catppuccin').setup {
        transparent_background = true,
      }

      vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },
}
