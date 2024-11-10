return {
  {
    'williamboman/mason.nvim',
  },
  'tpope/vim-sleuth',
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  {
    'numToStr/Comment.nvim',
    opts = {},
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {}, -- this is equalent to setup({}) function
  },

  { 'Shatur/neovim-session-manager' },
  { 'windwp/nvim-ts-autotag' },
  { 'nvim-neotest/nvim-nio' },
  { 'fladson/vim-kitty' },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
}
