return {
  'Exafunction/codeium.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
  },
  config = function()
    require('codeium').setup {
      enable_chat = true,
      enable_cmp_source = false,
      virtual_text = {
        enabled = true,
      },
    }
  end,
}