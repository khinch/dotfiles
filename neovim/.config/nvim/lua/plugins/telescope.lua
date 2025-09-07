return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("telescope").setup {
        defaults = {
          layout_strategy = 'horizontal',
          layout_config = {
            horizontal = {
              preview_width = 0.5,
              preview_cutoff = 100,
            },
          },
        }
      }
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  },
}
