-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "doomchad",

	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
}

M.nvdash = {
  load_on_startup = true,

  header = {
    "⠀⠀⠀⠀⠀⠀⠀⢏⠉⠁⠀⠀⡄⠀⠀⠀⡄⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⢀⠀⠀⠑⡄⠀⡇⠀⠀⢠⠃⠀⠘⢆⠈⠃⠀⠊⠙⡆⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠁⠉⠉⠀⠀⠉⠦⠜⠁⠀⠠⣀⣀⠇⠀⢀⡴⠊⠁⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠿⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠔⠋⠉⠀⠀⠀⠈⠉⠙⠢⣄⡀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⢠⠏⠀⠀⠀⠀⢀⣠⠤⠤⠤⠤⣤⡤⠤⣬⣧⣀⡀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⢰⠁⠀⠀⠀⡴⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⡄",
    "⠀⢀⡠⠤⠔⡶⡇⠀⠀⠀⢸⢸⣯⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡹",
    "⢠⠃⠀⠀⢠⢿⠁⠀⠀⠀⠈⣞⢟⣟⣄⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⠃",
    "⡇⠀⠀⠀⡠⢻⠀⠀⠀⠀⠀⠀⠉⠙⠛⠿⠿⣿⣻⣧⣿⣗⣟⣗⡺⢿⠉⠀⠀⠀",
    "⢇⠀⠀⠀⢸⢽⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢘⠀⠀⠀⠀",
    "⠘⡄⠀⠀⢀⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠅⠀⠀⠀⠀",
    "⠀⢳⡀⠀⠀⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠇⠀⠀⠀⠀",
    "⠀⠀⠈⠑⠚⠛⡟⣷⠀⠀⠀⠀⢠⠏⠉⠉⠉⠉⠳⡄⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⢳⣿⣕⢦⣄⠀⡞⠀⠀⠀⠀⠀⠀⣧⡇⠀⠀⠀⠇⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠙⠛⠏⠀⠀⠀⠀⠀⠀⣟⡿⣷⣤⡰⠁⠀⠀⠀⠀⠀",
    "",
    "",
  },

  buttons = {
    { txt = "  Restore CWD Session   ", keys = "<leader> q s", cmd = "lua require('persistence').load()" },
    { txt = "  Find File", keys = "<leader> f f", cmd = "Telescope find_files" },
    { txt = "  Recent Files", keys = "<leader> f o", cmd = "Telescope oldfiles" },
    -- more... check nvconfig.lua file for full list of buttons
  },
}

return M
