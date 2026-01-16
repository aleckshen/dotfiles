-- basic settings
vim.opt.number = true -- line number
vim.opt.relativenumber = true -- relative line number
vim.opt.cursorline = true -- highlight current line
vim.opt.scrolloff = 10 -- keep 10 lines above/below cursor
vim.opt.sidescrolloff = 8 -- keep 8 columns left/right of cursor
vim.opt.wrap = false -- don't wrap lines
vim.opt.cmdheight = 1 -- command line height
vim.opt.spelllang = { "en", "de" } -- language for spellchecking

-- tabbing/indentation
vim.opt.tabstop = 4 -- tab width
vim.opt.shiftwidth = 4 -- indent width
vim.opt.softtabstop = 4 -- soft tab stop
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.smartindent = true -- smart auto-indenting
vim.opt.autoindent = true -- copy indent form current line
vim.opt.grepprg = "rg --vimgrep" -- use ripgrep if available
vim.opt.grepformat = "%f:%l:%c:%m" -- filename, line number, column, content

-- search settings
vim.opt.ignorecase = true -- case-insensitive search
vim.opt.smartcase = true -- case-sensitive if uppercase in search
vim.opt.hlsearch = false -- don't highlight search results
vim.opt.incsearch = true -- show marches as you type

-- visual settings
vim.opt.termguicolors = true -- enable 24-bit colors
vim.opt.signcolumn = "yes" -- always show sign column
vim.opt.showmatch = true -- highlight matching brackets
vim.opt.matchtime = 2 -- how long to show matching brackets
vim.opt.completeopt = "menuone,noinsert,noselect" -- completion options
vim.opt.pumheight = 10 -- popup menu height
vim.opt.pumblend = 10 -- popup menu transparency
vim.opt.winblend = 0 -- floating window transparency
vim.opt.conceallevel = 0 -- don't hide markup
vim.opt.lazyredraw = false -- redraw while executing macros (better ux)
vim.opt.redrawtime = 10000 -- timeout for syntax highlighting redraw
vim.opt.maxmempattern = 20000 -- max memory for pattern matching
vim.opt.synmaxcol = 300 -- syntax highlighting column limit

-- file handling
vim.opt.backup = false -- don't create backup files
vim.opt.writebackup = false -- don't backup before overwriting
vim.opt.swapfile = false -- don't create swap files
vim.opt.undofile = true -- persistent undo
vim.opt.updatetime = 300 -- time in ms to trigger cursor hold
vim.opt.timeoutlen = 500 -- time in ms to wait for mapped sequence
vim.opt.ttimeoutlen = 0 -- no wait for key code sequences
vim.opt.autoread = true -- auto-reload file if changed outside
vim.opt.autowrite = false -- don't auto-save on some events
vim.opt.diffopt:append("vertical") -- vertical diff splits
vim.opt.diffopt:append("algorithm:patience") -- better diff algorithm
vim.opt.diffopt:append("linematch:60") -- better diff highlighting (smart line matching)

-- set undo directory and ensure it exits
local undodir = "~/.local/share/nvim/undodir" -- undo directory path
vim.opt.undodir = vim.fn.expand(undodir) -- expand to full path
local undodir_path = vim.fn.expand(undodir)
if vim.fn.isdirectory(undodir_path) == 0 then
	vim.fn.mkdir(undodir_path, "p") -- create if it doesn't exist
end

-- behavior settings
vim.opt.errorbells = false -- disable error sounds
vim.opt.backspace = "indent,eol,start" -- make backspace behave naturally
vim.opt.autochdir = false -- don't change directory automatically
vim.opt.iskeyword:append("-") -- treat dash as part of a word
vim.opt.path:append("**") -- search into subfolder with 'gf'
vim.opt.selection = "inclusive" -- use inclusive selection
vim.opt.mouse = "a" -- enable mouse support
vim.opt.modifiable = true -- allow editing buffers
vim.opt.encoding = "UTF-8" -- use UTF-8 encoding
vim.opt.wildmenu = true -- enable command-line completion menu
vim.opt.wildmode = "longest:full,full" -- completion mode for command-line
vim.opt.wildignorecase = true -- case-insensitive tab completion in commands

-- cursor settings
vim.opt.guicursor = {
	"n-v-c:block", -- normal, visual, command-line
	"i-ci-ve:block", -- insert, command-line insert, visual-exclusive
	"r-cr:hor20", -- replace, command-line replace
	"o:hor50", -- operator-pending
	"a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor", -- all modes: blinking & highlight groups
	"sm:block-blinkwait175-blinkoff150-blinkon175", -- showmatch mode
}

-- folding settings
vim.opt.foldmethod = "expr" -- use expression for folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- use treesitter for folding
vim.opt.foldlevel = 99 -- keep all folds open by default

--split behavior
vim.opt.splitbelow = true -- horizontal splits open below
vim.opt.splitright = true -- vertical splits open to the right
