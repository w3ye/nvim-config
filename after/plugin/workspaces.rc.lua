local ok, project = pcall(require, "project_nvim")
if not ok then
  return
end

project.setup({
  -- hooks = {
  --   open = function()
  --     require('sessions').load(nil, { silent = true })
  --   end,
  -- }
})
