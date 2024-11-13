require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>ll", ":Limelight!!<CR>", { desc = "Toggle Limelight" })
map("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
map("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)
map("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
map("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)
map("n", "<leader>qs", function() require("persistence").load() end, { desc = "Restore cwd session" }) -- load the session for the current directory
map("n", "<leader>qS", function() require("persistence").select() end, { desc = "Select session" }) -- select a session to load
map("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { desc = "Restore last session" }) -- load the last session
map("n", "<leader>qd", function() require("persistence").stop() end, { desc = "Stop Persistence" }) -- stop Persistence => session won't be saved on exit

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
