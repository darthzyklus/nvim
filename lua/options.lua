local options = {
  relativenumber = true, -- set relative numbered lines
  shiftwidth = 4,        -- the number of spaces inserted for each indentation
  tabstop = 4,           -- insert 4 spaces for a tab
  wrap = false,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
