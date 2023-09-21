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

local db = lvim.builtin.alpha.dashboard

db.section.header.val = function()
    if vim.fn.winwidth(0) > 120 then
        return header_alt
    elseif vim.fn.winwidth(0) > 80 then
        return header_mid
    else
        return header_small
    end
end

-- Center --
db.section.buttons.entries = {
    {"f", "  Find file", ":Telescope find_files <CR>"},
    {"n", "  New file", ":ene <BAR> startinsert <CR>"},
    {"p", "  Project", ":Telescope projects <CR>"},
    {"o", "  Old files", ":Telescope oldfiles <CR>"},
    {"t", "  Find text", ":Telescope live_grep <CR>"},
    {"c", "  Colorscheme", ":Telescope colorscheme <CR>"},
    {
        "s",
        lvim.icons.ui.Gear .. "  Settings",
        ":edit " .. require("lvim.config"):get_user_config_path() .. " <Cr>"
    },
    {"q", "  Quit", ":qa<CR>"},
}

-- Footer --
db.section.footer.val = {
    "",
    "",
    "",
    "Support you, carry me.",
}

db.section.header.opts.hl = "Label"
db.section.buttons.opts.hl_shortcut = "Include"
db.section.footer.opts.hl = "Number"
