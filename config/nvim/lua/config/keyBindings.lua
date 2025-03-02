--local leader
vim.g.mapleader = " "
vim.g.maplocalleader = ","
--Neotree
vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>")
vim.keymap.set("n", "<C-a>", "ggVG")
--split window
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

--split navigation
vim.keymap.set("n", "<leader>ml", "<C-w>l", { desc = "Move right" })
vim.keymap.set("n", "<leader>mh", "<C-w>h", { desc = "Move left" })
vim.keymap.set("n", "<leader>mj", "<C-w>j", { desc = "Move down" })
vim.keymap.set("n", "<leader>mk", "<C-w>k", { desc = "Move Up" })

--tabs
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previoes tab" })
-- vim.keymap.set("n", "<F9>", "<cmd>wa | !g++ %<CR>", { desc = "Compile and run cpp file" })

--Competitive Programming
vim.keymap.set("n", "<leader>rr", "<cmd>CompetiTest run<CR>", { desc = "Compile and run cpp file for CP" })
vim.keymap.set("n", "<leader>rc", "<cmd>CompetiTest receive contest<CR>", { desc = "receive contest" })
vim.keymap.set("n", "<leader>rp", "<cmd>CompetiTest receive problem<CR>", { desc = "receive problem" })
-- Competitive Programming (test cases)
vim.keymap.set("n", "<leader>at", "<cmd>CompetiTest add_testcase<CR>", { desc = "Add testcase" })
vim.keymap.set("n", "<leader>et", "<cmd>CompetiTest edit_testcase<CR>", { desc = "Edit testcase" })


--gcc for commenting a sigle line
--gc for commenting a selection in visual mode
-- fm for formatting 
--gd for going to defination
--<C-o> to return back
-- <leader>rn to rename a variable for intire project
