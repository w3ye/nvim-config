function Colour(color)
  color = color or "rose-pine"
  local switch = {
    ["rose-pine"] = require("will.colours.rose_pine"),
  }
  vim.cmd.colorscheme(color)
  return switch[color]
end

Colour()
