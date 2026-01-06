-- center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "half page up (centered)" })

-- buffer navigation
vim.keymap.set("n", "<leader>bn", "<Cmd>bnext<CR>", { desc = "next buffer" })
vim.keymap.set("n", "<leader>bp", "<Cmd>bprevious<CR>", { desc = "previous buffer" })

-- better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "move to right window" })

-- splitting & resizing
vim.keymap.set("n", "<leader>sv", "<Cmd>vsplit<CR>", { desc = "split window vertically" })
vim.keymap.set("n", "<leader>sh", "<Cmd>split<CR>", { desc = "split window horizontally" })

-- for resizing to work on macos, disable system-settings/keyboard-shortcuts/mission-control
vim.keymap.set("n", "<C-Up>", "<Cmd>resize +2<CR>", { desc = "increase window height" })
vim.keymap.set("n", "<C-Down>", "<Cmd>resize -2<CR>", { desc = "decrease window height" })
vim.keymap.set("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", { desc = "decrease window width" })
vim.keymap.set("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", { desc = "increase window width" })

-- better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- better J behavior
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- quick config editing
vim.keymap.set("n", "<leader>rc", "<Cmd>e ~/.config/nvim/init.lua<CR>", { desc = "Edit config" })