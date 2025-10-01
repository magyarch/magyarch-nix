--- lua/plugins.lua
return require("lazy").setup({
  -- Tpope pluginok
  { "tpope/vim-surround" },
  { "tpope/vim-commentary" },

  -- NERDTree
  { "preservim/nerdtree" },

  -- Goyo
  { "junegunn/goyo.vim" },

  -- Colorschemes
{
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  config = function()
    vim.cmd("colorscheme catppuccin")
  end,
},

{ "christianchiarulli/nvcode-color-schemes.vim" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
  },

  -- Vimagit
  { "jreybert/vimagit" },

  -- LukeSmith vimling
  { "LukeSmithxyz/vimling" },

  -- Vimwiki
  { "vimwiki/vimwiki" },

  -- Airline (statusline)
  { "vim-airline/vim-airline" },
  { "nvim-lualine/lualine.nvim", config = function()
      require("lualine").setup()
    end },

  -- NvimTree
  { "nvim-tree/nvim-tree.lua", config = function()
      require("nvim-tree").setup()
    end },
  { "nvim-tree/nvim-web-devicons" },

  -- Telescope
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" }, config = function()
      require("telescope").setup()
    end },

  -- Git
  { "lewis6991/gitsigns.nvim", config = function()
      require("gitsigns").setup()
    end },

  -- Autopairs
  { "windwp/nvim-autopairs", config = function()
      require("nvim-autopairs").setup {}
    end },

  -- Comment
  { "numToStr/Comment.nvim", config = function()
      require("Comment").setup()
    end },

  -- Vifm
  { "vifm/vifm.vim" },

  -- sxhkd syntax highlight
  { "kovetskiy/sxhkd-vim" },

  -- LSP
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
})

