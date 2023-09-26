return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Banner --
		local header_small = {

			"",
			"",
			"",
			"",
			"    ___                _ _            __  _            ",
			"   <  /___ ___  ____  / (_)________ _/ /_(_)___  ____  ",
			"   / / __ `__ |/ __ |/ / / ___/ __ `/ __/ / __ |/ __ | ",
			"  / / / / / / / /_/ / / / /__/ /_/ / /_/ / /_/ / / / / ",
			" /_/_/ /_/ /_/ .___/_/_/|___/|__,_/|__/_/|____/_/ /_/  ",
			"            /_/                                        ",
			"",
			"",
			"",
			"",
			"",
			"",
		}

		local header_mid = {

			"",
			"",
			"",
			"",
			"  ██╗███╗   ███╗██████╗ ██╗     ██╗ ██████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗ ",
			" ███║████╗ ████║██╔══██╗██║     ██║██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║ ",
			" ╚██║██╔████╔██║██████╔╝██║     ██║██║     ███████║   ██║   ██║██║   ██║██╔██╗ ██║ ",
			"  ██║██║╚██╔╝██║██╔═══╝ ██║     ██║██║     ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║ ",
			"  ██║██║ ╚═╝ ██║██║     ███████╗██║╚██████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║ ",
			"  ╚═╝╚═╝     ╚═╝╚═╝     ╚══════╝╚═╝ ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝ ",
			"",
			"",
			"",
			"",
			"",
			"",
		}

		local header_alt = {
			"",
			"",
			"",
			"",
			" ██▓ ███▄ ▄███▓ ██▓███   ██▓     ██▓ ▄████▄   ▄▄▄     ▄▄▄█████▓ ██▓ ▒█████   ███▄    █  ",
			"▓██▒▓██▒▀█▀ ██▒▓██░  ██▒▓██▒    ▓██▒▒██▀ ▀█  ▒████▄   ▓  ██▒ ▓▒▓██▒▒██▒  ██▒ ██ ▀█   █  ",
			"▒██▒▓██    ▓██░▓██░ ██▓▒▒██░    ▒██▒▒▓█    ▄ ▒██  ▀█▄ ▒ ▓██░ ▒░▒██▒▒██░  ██▒▓██  ▀█ ██▒ ",
			"░██░▒██    ▒██ ▒██▄█▓▒ ▒▒██░    ░██░▒▓▓▄ ▄██▒░██▄▄▄▄██░ ▓██▓ ░ ░██░▒██   ██░▓██▒  ▐▌██▒ ",
			"░██░▒██▒   ░██▒▒██▒ ░  ░░██████▒░██░▒ ▓███▀ ░ ▓█   ▓██▒ ▒██▒ ░ ░██░░ ████▓▒░▒██░   ▓██░ ",
			"░▓  ░ ▒░   ░  ░▒▓▒░ ░  ░░ ▒░▓  ░░▓  ░ ░▒ ▒  ░ ▒▒   ▓▒█░ ▒ ░░   ░▓  ░ ▒░▒░▒░ ░ ▒░   ▒ ▒  ",
			" ▒ ░░  ░      ░░▒ ░     ░ ░ ▒  ░ ▒ ░  ░  ▒     ▒   ▒▒ ░   ░     ▒ ░  ░ ▒ ▒░ ░ ░░   ░ ▒░ ",
			" ▒ ░░      ░   ░░         ░ ░    ▒ ░░          ░   ▒    ░       ▒ ░░ ░ ░ ▒     ░   ░ ░  ",
			" ░         ░                ░  ░ ░  ░ ░            ░  ░         ░      ░ ░           ░  ",
			"                                    ░                                                   ",
			"",
			"",
			"",
			"",
			"",
			"",
		}

		-- Set header
		dashboard.section.header.val = function()
			if vim.fn.winwidth(0) > 120 then
				return header_alt
			elseif vim.fn.winwidth(0) > 80 then
				return header_mid
			else
				return header_small
			end
		end

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
			dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("p", "  Project", ":Telescope projects <CR>"),
			dashboard.button("o", "  Old files", ":Telescope oldfiles <CR>"),
			dashboard.button("t", "󰊄  Find text", ":Telescope live_grep <CR>"),
			dashboard.button("c", "  Colorscheme", ":Telescope colorscheme <CR>"),
			dashboard.button("s", "  Settings", ":edit " .. vim.fn.stdpath("config") .. " <CR>"),
			dashboard.button("q", "󰗼  Quit", ":qa<CR>"),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
