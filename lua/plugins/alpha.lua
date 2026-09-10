local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  "██╗   ██╗██╗███╗   ███╗    ██████╗ ████████╗██╗    ██╗",
  "██║   ██║██║████╗ ████║    ██╔══██╗╚══██╔══╝██║    ██║",
  "██║   ██║██║██╔████╔██║    ██████╔╝   ██║   ██║ █╗ ██║",
  "╚██╗ ██╔╝██║██║╚██╔╝██║    ██╔══██╗   ██║   ██║███╗██║",
  " ╚████╔╝ ██║██║ ╚═╝ ██║    ██████╔╝   ██║   ╚███╔███╔╝",
  "  ╚═══╝  ╚═╝╚═╝     ╚═╝    ╚═════╝    ╚═╝    ╚══╝╚══╝ ",
}

dashboard.section.buttons.val = {
  dashboard.button("f", "  Find File", "<Cmd>Telescope find_files<CR>"),
  dashboard.button("t", "  File Tree", "<Cmd>Neotree toggle float<CR>"),
  dashboard.button("g", "  Live Grep", "<Cmd>Telescope live_grep<CR>"),
  dashboard.button("q", "  Quit", "<Cmd>qa<CR>"),
}

dashboard.section.footer.val = "Dedicate your heart."

alpha.setup(dashboard.config)
