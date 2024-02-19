vim.g.mapleader = " "

-- Open up Netrw
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Open Netrw" })

-- Close all buffers except current one (including [No Name] buffer)
vim.keymap.set("n", "<leader>bc", ":%bd|e#|bd#<cr>", { desc = "Close other buffers" })

-- Move highlighted lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in the middle when jumping half pages
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move up 1/2 page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move down 1/2 page" })

-- Keep cursor in the middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Better pasting
vim.keymap.set({ "n", "v", "x" }, "pp", "P", { desc = "Paste w/o losing text" })
vim.keymap.set({ "n", "v", "x" }, "pP", "p", { desc = "Paste & lose text" })
vim.keymap.set("n", "piw", "viwP", { desc = "Paste over (w)ord (w/o losing text)" })
vim.keymap.set("n", "piW", "viWP", { desc = "Paste over (W)ord (w/o losing text)" })

-- Delete without copying
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete w/o copying" })
vim.keymap.set({ "n", "v" }, "x", '"_x', { desc = "Delete single char w/o copying" })
vim.keymap.set({ "n", "v" }, "c", '"_c', { desc = "C-Delete w/o copying" })

-- No-ops
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")
vim.keymap.set("n", "<enter>", "<nop>")
vim.keymap.set("n", "<tab>", "<nop>")
vim.keymap.set({ "n", "v" }, "s", "<nop>")
vim.keymap.set({ "n", "v" }, "S", "<nop>")

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Prev location" })

-- Prev file
vim.keymap.set("n", "<C-\\>", "<C-^>", { desc = "Prev file" })
vim.keymap.set("i", "<C-\\>", "<esc><C-^>", { desc = "Prev file" })

-- Search word under cursor
vim.keymap.set({ "n", "x" }, "gw", "*N")

-- Replace word under cursor
vim.keymap.set(
	"n",
	"<leader>S",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word under cursor" }
)

-- Save on ctrl-s
vim.keymap.set({ "n", "i", "v", "s" }, "S4", "<cmd>w<cr>", { desc = "Save" })

-- Cycle buffers
vim.keymap.set("n", "H", "<cmd>bp<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "L", "<cmd>bn<cr>", { desc = "Next buffer" })

-- windows
vim.keymap.set("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
vim.keymap.set("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

-- tabs
vim.keymap.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
vim.keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
vim.keymap.set("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
vim.keymap.set("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Quit all
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set({ "n", "x", "o" }, "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set({ "n", "x", "o" }, "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Add undo break-points
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- better up/down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Save without formatting
vim.keymap.set("n", "<leader>ns", "<cmd>noa w<cr>", { desc = "No autocommand save" })

-- Show last error
vim.keymap.set("n", "<C-e>", "<cmd>:echo v:errmsg<cr>", { desc = "Show last error" })

-- Restart LSP
vim.keymap.set("n", "<leader>rl", "<cmd>LspRestart<cr>", { desc = "Restart LSP" })
