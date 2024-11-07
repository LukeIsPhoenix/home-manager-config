local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "solargraph"
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
       ensure_installed = {
        "ruby",
        "lua",
        "nix"
      }
    },
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp",
      require'luasnip'.filetype_extend("ruby", {"rails"})
    }
  }
}
return plugins
