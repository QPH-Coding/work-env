require('icons')
local status, navic = pcall(require, "nvim-navic")
if not status then
  vim.notify("没有找到 nvim-navic")
  return
end

navic.setup {
  icons = Icons,
  highlight = false,
  separator = " > ",
  depth_limit = 0,
  depth_limit_indicator = "..",
  safe_output = true
}
