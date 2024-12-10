map = vim.keymap.set

vim.g.mapleader = " "
map("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
map("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)
map("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
map("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)
map("n", "<leader>qs", function() require("persistence").load() end, { desc = "Restore cwd session" }) -- load the session for the current directory
map("n", "<leader>qS", function() require("persistence").select() end, { desc = "Select session" }) -- select a session to load
map("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { desc = "Restore last session" }) -- load the last session
map("n", "<leader>qd", function() require("persistence").stop() end, { desc = "Stop Persistence" }) -- stop Persistence => session won't be saved on exit
map("n", "<leader>lg", ":LazyGit<CR>")
map("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- oil setup
require("oil").setup({
	cleanup_delay_ms = 1000,
	view_options = {
	  show_hidden = true
	}
})
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

require('leap').create_default_mappings()

-- TELESCOPE FUNCTIONS
-- part of the config
-- Set your fixed file path here
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
-- Set your fixed file path here
function recent_files()
  require('telescope.builtin').find_files({
    prompt_title = "Recent Files",
    cwd = fixed_path,
    find_command = { "sh", "-c", "find " .. fixed_path .. " -type f -not -path '*/\\.git/*' -printf '%T@ %p\n' | sort -n -r | cut -d' ' -f2-" },
  })
end

local custom_actions = {}
custom_actions.insert_path = function(prompt_bufnr)
  local entry = action_state.get_selected_entry()
  actions.close(prompt_bufnr)
  vim.api.nvim_put({ entry.value }, '', false, true)
end

-- telescope config
require('telescope').setup({
  defaults = {
    scroll_strategy = 'limit',
    layout_strategy = 'horizontal',
  }
})
require('telescope').load_extension('fzf')

require("hardtime").setup({
  disable_mouse = false,
  max_count = 2
})

require('lualine').setup {
  sections = {
    lualine_c = { { 'filename', path = 2 } }
  }
}

require('gitsigns').setup{
  current_line_blame = true
}

local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }),
})

require("nvim-autopairs").setup()

require("toggleterm").setup {
  open_mapping = [[<c-\>]],
  insert_mappings = true,
  dir = git_dir,
  size = 20
}

local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

map("n", "<leader>ha", function() harpoon:list():add() end)
map("n", "<leader>hr", function() harpoon:list():remove() end)
map("n", "<leader>hc", function() harpoon:list():clear() end)

map("n", "<leader>j", function() harpoon:list():select(1) end)
map("n", "<leader>k", function() harpoon:list():select(2) end)
map("n", "<leader>l", function() harpoon:list():select(3) end)
map("n", "<leader>;", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
map("n", "<C-n>", function() harpoon:list():prev() end)
map("n", "<C-m>", function() harpoon:list():next() end)

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

map("n", "<leader>hl", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })

vim.cmd [[
colorscheme catppuccin-macchiato
set noswapfile
set number relativenumber
set scrolloff=5
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set clipboard=unnamedplus

" Telescope searching
" clear the highlighting from search
nnoremap <Leader><Enter> :nohlsearch<CR> " telescope
" map <Leader>F to search for the current word under the cursor
nnoremap <Leader>W viw"0y<space>:Telescope grep_string<CR><Esc>
"nnoremap <Leader>F :Telescope grep_string<CR><Esc>
nnoremap <Leader>F :FzfLua grep_visual<CR>

nnoremap <Leader>fw :Telescope live_grep<CR>
nnoremap <Leader>ff :Telescope find_files<CR>
inoremap <M-i> <Esc>:Telescope find_files hidden=true<CR>
noremap  <M-i> <Esc>:Telescope find_files hidden=true<CR>
nnoremap <Leader>o :Telescope oldfiles<CR><Esc>
nnoremap <Leader>C :Telescope current_buffer_fuzzy_find<CR>

" expirimental tmux navigator
let g:tmux_navigator_no_mappings = 1
" let  g:tmux_navigator_no_wrap = 1

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
noremap <silent> <C-h> :<C-U>TmuxNavigateLeft<cr>
noremap <silent> <C-j> :<C-U>TmuxNavigateDown<cr>
noremap <silent> <C-k> :<C-U>TmuxNavigateUp<cr>
noremap <silent> <C-l> :<C-U>TmuxNavigateRight<cr>
noremap <silent> <C-/> :<C-U>TmuxNavigatePrevious<cr>


" mapping with meta 
nnoremap <M-Left> <C-w>h
nnoremap <M-Down> <C-w>j
nnoremap <M-Up> <C-w>k
nnoremap <M-Right> <C-w>l
noremap <silent> <M-Left>  :<C-U>TmuxNavigateLeft<cr>
noremap <silent> <M-Down>  :<C-U>TmuxNavigateDown<cr>
noremap <silent> <M-Up>    :<C-U>TmuxNavigateUp<cr>
noremap <silent> <M-Right> :<C-U>TmuxNavigateRight<cr>
]]
