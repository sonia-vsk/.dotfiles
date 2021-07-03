require 'paq-nvim' {
  'savq/paq-nvim';

  'neovim/nvim-lspconfig';
  'kabouzeid/nvim-lspinstall';

  'hoob3rt/lualine.nvim';
  'kyazdani42/nvim-web-devicons';

  { 'nvim-treesitter/nvim-treesitter', run=':TSUpdate' };

  'hrsh7th/nvim-compe';

  'rmagatti/auto-session';
  'rmagatti/session-lens';
  'crispgm/telescope-heading.nvim';
  'nvim-lua/popup.nvim';
  'nvim-lua/plenary.nvim';
  'nvim-telescope/telescope.nvim';

  'benmills/vimux';
  'janko-m/vim-test';

  {
    'prettier/vim-prettier', -- prettier formatter
    run = 'yarn install',
    branch = 'release/0.x',
  };

  'janko-m/vim-test';
  'benmills/vimux';

  'w0rp/ale';
}
