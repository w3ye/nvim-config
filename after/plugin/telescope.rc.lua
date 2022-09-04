local actions = require("telescope.actions")

local telescope = require("telescope")
telescope.load_extension("workspaces")

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }
    },
  },
  extensions = {
    workspaces = {
      keep_insert = true,
    }
  }
}
