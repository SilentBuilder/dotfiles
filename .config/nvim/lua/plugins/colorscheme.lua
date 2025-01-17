return {
  {
    'miikanissi/modus-themes.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'modus_operandi'
    end,
  },

  {
    'brenoprata10/nvim-highlight-colors',
    config = function()
      require('nvim-highlight-colors').setup {}
    end,
  },
}
