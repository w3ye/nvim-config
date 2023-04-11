local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")
local lga_actions = require("telescope-live-grep-args.actions")

require("telescope").setup({
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim", -- add this value
    },
    mappings = {
      i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-t>"] = trouble.open_with_trouble,
            ["<M-d>"] = actions.delete_buffer,
            ["<C-u>"] = false,
      },
      n = {
            ["<C-t>"] = trouble.open_with_trouble,
            ["<C-d>"] = actions.delete_buffer,
      },
    },
    file_ignore_patterns = {
      "node_modules",
    },
    path_display = { "truncate" },
  },
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden", "--no-ignore", "--glob", "!.git/*" },
    },
  },
  extensions = {
    live_grep_args = {
      auto_quoting = false,
      mappings = {
        i = {
              ["<C-l>"] = lga_actions.quote_prompt(),
              ["<C-t>"] = lga_actions.quote_prompt({ postfix = " -t" }),
        },
      },
    },
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("live_grep_args")
