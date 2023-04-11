local github_theme = require('github-theme')

github_theme.setup {
  comment_style = "NONE",
  function_style = "bold",
  theme_style = "dark_colorblind",
  sidebars = { "qf", "vista_kind", "terminal", "packer" },
}
