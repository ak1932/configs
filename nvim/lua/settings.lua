-- vim settings
vim.o.completeopt = "menu,menuone,noselect"

vim.o.ruler = true -- Show the cursor position all the time
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.splitright = true -- Vertical splits will automatically be to the right 
vim.o.pumheight = 10  -- Makes popup menu smaller
-- filetype plugin on
-- Search recursively downward from CWD; provides TAB completion for filenames
-- e.g., `:find vim* <TAB>`
vim.o.path = vim.o.path .. "**"
vim.o.tagcase = "smart"
vim.o.tags = "./tags;/"
-- number of lines at the beginning and end of files checked for file-specific vars
vim.o.modelines = 0

-- reload files changed outside of Vim not currently modified in Vim (needs below)
vim.o.autoread = true

-- http://stackoverflow.com/questions/2490227/how-does-vims-autoread-work#20418591
-- au FocusGained,BufEnter * :silent! !
-- use Unicode
vim.o.encoding = "utf-8"

-- errors flash screen rather than emit beep
vim.o.visualbell = true

-- make Backspace work like Delete
vim.o.backspace = "indent,eol,start"

-- don't create `filename~` backups
vim.o.backup = false

-- don't create temp files
vim.o.swapfile = false

-- line numbers and distances
vim.o.relativenumber=true
vim.o.number=true

-- number of lines offset when jumping
vim.o.scrolloff = 2

-- Tab key enters 4 spaces
-- CTRL-v-TAB
vim.o.expandtab=true
vim.o.tabstop=4
vim.o.shiftwidth=4
vim.o.softtabstop = 4

-- Indent new line the same as the preceding line
vim.o.autoindent = true

-- statusline indicates insert or normal mode

-- make scrolling and painting fast
-- ttyfast kept for vim compatibility but not needed for nvim
vim.o.ttyfast = true
vim.o.lazyredraw = true

-- highlight matching parens, braces, brackets, etc
vim.o.showmatch = true

-- http://vim.wikia.com/wiki/Searching
-- hlsearch - highlight searches, incsearch - highlight searches before i press
-- enter smartcase - dont ignorecase when explicitly caps are used
vim.o.hlsearch, vim.o.incsearch, vim.o.ignorecase, vim.o.smartcase = true,true,true,true

-- http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
vim.o.autochdir = true

-- open new buffers without saving current modifications (buffer remains open)
vim.o.hidden=true

-- http://stackoverflow.com/questions/9511253/how-to-effctively-use-vim-wildmenu
vim.o.wildmenu = true
vim.o.wildmode = "list:longest,full"

-- StatusLine always visible, display full path
-- http://learnvimscriptthehardway.stevelosh.com/chapters/17.html
vim.o.laststatus=2
vim.o.statusline = "%F"

-- Use system clipboard
-- http://vim.wikia.com/wiki/Accessing_the_system_clipboard
-- for linux
vim.o.clipboard="unnamedplus"

-- Folding
-- https://vim.fandom.com/wiki/Folding
-- https://vim.fandom.com/wiki/All_folds_open_when_opening_a_file
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
-- Toggle fold with za
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 5
vim.o.foldnestmax = 1
vim.o.foldlevelstart = 1
vim.o.encoding = "UTF-8"
