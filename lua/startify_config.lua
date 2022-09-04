vim.cmd([[
  let g:startify_lists = [
    \ {'type': 'files', 'header': ['    Files']},
    \ {'type': 'dir', 'header': ['    Current Directory'. getcwd()]},
    \ {'type': 'sessions', 'header': ['    Sessions']},
    \ {'type': 'bookmarks', 'header': ['    Bookmarks']}
  \ ]
]])
vim.cmd([[
  let g:startify_bookmarks = [
    \ {'i': '~/.config/nvim/init.lua'}
  \ ]
]])
