local ok, project = pcall(require, "project_nvim")
if not ok then
  return
end

project.setup({
  -- the option to manually do so using `:ProjectRoot` command.
  manual_mode = true,
  patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "packer_compiled.lua" },
})
