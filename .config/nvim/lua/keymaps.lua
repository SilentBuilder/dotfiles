-- Personal
vim.keymap.set('n', '\\', '<cmd>vsplit<cr>')
vim.keymap.set('n', '|', '<cmd>split<cr>')
vim.keymap.set('n', '<leader>w', ':w<cr>')
vim.keymap.set('n', '<leader>q', ':q<cr>')

-- Coding
vim.keymap.set('n', '<F4>', '<cmd>!g++ -Wall -Wextra -Wshadow -o %:r %:r.cpp<cr>')
vim.keymap.set('n', '<F5>', '<cmd>!g++ -Wall -Wextra -Wshadow -o %:r %:r.cpp && ./%:r<cr>')

-- Telescope
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = 'Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = 'Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<c-p>', require('telescope.builtin').find_files, { desc = 'Search files' })
vim.keymap.set('n', '<c-g>', require('telescope.builtin').git_files, { desc = 'Search files' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = 'Find current word' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Find Grep' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = 'Find Diagnostics' })

-- Neotree
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>')

-- Dap
vim.keymap.set('n', '<leader>db', '<cmd>DapToggleBreakpoint<cr>')
vim.keymap.set('n', '<leader>dr', '<cmd>DapContinue<cr>')

-- Session manager
vim.keymap.set('n', '<leader>ss', ':SessionManager save_current_session<cr>')
vim.keymap.set('n', '<leader>sl', ':SessionManager load_session<cr>')
vim.keymap.set('n', '<leader>sL', ':SessionManager load_last_session<cr>')
vim.keymap.set('n', '<leader>sd', ':SessionManager delete_session<cr>')

-- ToggleTerm
vim.keymap.set('i', '<C-n>', ':ToggleTerm direction=float<cr>')
vim.keymap.set('n', '<C-n>', ':ToggleTerm direction=float<cr>')
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end
-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
