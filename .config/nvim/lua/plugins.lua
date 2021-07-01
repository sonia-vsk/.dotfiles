require 'paq-nvim' {
  'savq/paq-nvim';

  'neovim/nvim-lspconfig';

  'glepnir/spaceline.vim';
  'ryanoasis/vim-devicons';
  'airblade/vim-gitgutter';

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
}
