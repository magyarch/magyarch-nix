-- Kulcskiosztások
local map = vim.keymap.set

-- Mentés / kilépés
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")

-- NvimTree
map("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>")
map("n", "<leader>fg", ":Telescope live_grep<CR>")
map("n", "<leader>fb", ":Telescope buffers<CR>")
map("n", "<leader>fh", ":Telescope help_tags<CR>")

