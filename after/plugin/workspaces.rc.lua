local ok, workspaces = pcall(require, "workspaces")
if not ok then
  return
end

workspaces.setup({
  hooks = {
    open = function()
      require('sessions').load(nil, { silent = true })
    end,
  }
})
