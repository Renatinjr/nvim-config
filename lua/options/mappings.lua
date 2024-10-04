local map = vim.keymap.set
map({ "i" }, "<C-s>", "<C-o>:w<ENTER>")
map({ "n" }, "<C-s>", ":w<ENTER>")
map({ "v" }, "<leader>fr", ":s/")
