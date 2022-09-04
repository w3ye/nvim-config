local ok, neotree = pcall(require, "neo-tree")
if not ok then
  print('neo-tree not installed')
  return
end

neotree.setup({})
