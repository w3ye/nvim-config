local ok, rose = pcall(require, "rose-pine")
local r = "rose-pine"

if not ok then
  print("rose-pine not installed")
  return
end

rose.setup({
  disable_italics = true,
})
