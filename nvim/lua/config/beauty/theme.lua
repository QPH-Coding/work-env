-- tokyonight-night, tokyonight-storm, tokyonight-day, tokyonight-moon
-- zephyer
local colorscheme = "tokyonight-night"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
  return
end
