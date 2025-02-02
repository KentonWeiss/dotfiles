-- Credit: NvChad Default Configuration

local opt = vim.opt
local o = vim.o

---------- options ----------
o.laststatus = 3
o.showmode = false

o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"

o.wrap = false

-- Indenting
o.expandtab = true
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
o.numberwidth = 2
o.ruler = false

-- Disable nvim into
opt.shortmess:append "sI"

-- TODO: Check what this does
o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

-- Interval for writing swap file to disk
o.updatetime = 250

opt.whichwrap:append "<>[]hl"

