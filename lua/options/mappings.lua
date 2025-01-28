local map = vim.keymap.set

--Insert Mode
map({ "i" }, "<C-s>", "<C-o>:w<ENTER>")

--Normal Mode
map({ "n" }, "<C-s>", ":w<ENTER>")
map({ "n" }, "<C-S-Down>", ":m +1<ENTER>")
map({ "n" }, "<C-S-Up>", ":m -2<ENTER>")

-- Visual Mode
map({ "v" }, "<C-S-Up>", ": m -2<ENTER>")
map({ "v" }, "<C-S-Down>", ": m +1<ENTER>")
map({ "v" }, "<leader>fp", ":s/")
