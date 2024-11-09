return {
  'nvim-neotest/neotest',
  keys = {
    { '<leader>to', ':lua require("neotest").output_panel.open({ enter = true })<CR>', desc = 'Open Neotest Output' },
    { '<leader>tt', ':lua require("neotest").run.run()<CR>', desc = 'Run Neotest' },
    { '<leader>tf', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', desc = 'Run Neotest File' }, { '<leader>td', ':lua require("neotest").run.run({strategy = "dap"})<CR>', desc = 'Run Neotest Debug' },
  },
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-jest',
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-jest' {
        jestCommand = function(path)
          normalized_path = path:gsub("\\", "/")
          command = "npx jest --  --forceExit --detectOpenHandles "
          return command .. normalized_path

        end,
        discovery = {
          enabled = false,
	},
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd():gsub('\\', '/')
          end,
        },
      },
    }
  end,
}
