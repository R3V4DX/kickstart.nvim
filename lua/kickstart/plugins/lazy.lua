-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

local plugins = 'kickstart.plugins'
local themes = 'kickstart.themes'

-- [[ Configure and install plugins ]]
require('lazy').setup({
  { 'tpope/vim-sleuth' }, -- Detect tabstop and shiftwidth automatically

  require(plugins .. '.gitsigns'),
  require(plugins .. '.which-key'),
  require 'kickstart.plugins.telescope',

  -- LSP Plugins
  require 'kickstart.plugins.lazydev',
  { 'Bilal2453/luvit-meta', lazy = true },
  require 'kickstart.plugins.nvim-lspconfig',
  require 'kickstart.plugins.conform',
  require 'kickstart.plugins.nvim-cmp',

  require(themes .. '.tokyonight'),

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  require 'kickstart.plugins.mini',
  require 'kickstart.plugins.nvim-treesitter',
  require(plugins .. '.codeium'),

  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',
  -- require 'kickstart.plugins.neo-tree',

  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  -- { import = 'custom.plugins' },
  --
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
