return {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local alpha = require('alpha')
        local dashboard = require('alpha.themes.dashboard')

        -- ASCII art header
	dashboard.section.header.val = {  
	"██╗   ██╗██╗███╗   ███╗    ██████╗ ████████╗██╗    ██╗",
  	"██║   ██║██║████╗ ████║    ██╔══██╗╚══██╔══╝██║    ██║",
  	"██║   ██║██║██╔████╔██║    ██████╔╝   ██║   ██║ █╗ ██║",
  	"╚██╗ ██╔╝██║██║╚██╔╝██║    ██╔══██╗   ██║   ██║███╗██║",
  	" ╚████╔╝ ██║██║ ╚═╝ ██║    ██████╔╝   ██║   ╚███╔███╔╝",
  	"  ╚═══╝  ╚═╝╚═╝     ╚═╝    ╚═════╝    ╚═╝    ╚══╝╚══╝ ",
}
        -- Buttons
        dashboard.section.buttons.val = {
            dashboard.button("f", "  Find File",    "<Cmd>Telescope find_files<CR>"),
		dashboard.button("t", "File Tree", "<Cmd>Neotree toggle float<CR>"),
            dashboard.button("g", "  Live Grep",    "<Cmd>Telescope live_grep<CR>"),
            dashboard.button("q", "  Quit",         "<Cmd>qa<CR>"),
        }

        -- Footer
        dashboard.section.footer.val = "Dedicate your heart."

        alpha.setup(dashboard.config)
    end,
}
