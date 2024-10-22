local set = vim.keymap.set
local opt = { noremap = true, silent = true }

set("n", "<F1>", ":NvimTreeToggle<CR>", opt)
set("n", "<F3>", ":NvimTreeFindFile<CR>", opt)

set("n", "gp", ":BufferLinePick<CR>", opt)
set("n", "gc", ":BufferLinePickClose<CR>", opt)
set("n", "gt", ":BufferLineCycleNext<CR>", opt)
set("n", "gT", ":BufferLineCyclePrev<CR>", opt)

set('n', '<C-T>', ":Telescope find_files hidden=true<CR>", opt)
set('n', '<C-L>', ":Telescope live_grep<CR>", opt)

set('n', "<C-\\>f", ":ToggleTerm direction=float<CR>", opt)
set('n', "<C-\\>h", ":ToggleTerm direction=horizontal<CR>", opt)
set('n', "<C-\\>v", ":ToggleTerm direction=vertical<CR>", opt)

set("n", "go", "<cmd>Lspsaga outline<CR>", opt)

set("n", "<leader>se", function() require("scissors").editSnippet() end)
set({ "n", "x" }, "<leader>sa", function() require("scissors").addNewSnippet() end)

local ls = require("luasnip")

set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

set({ "i", "s" }, "<C-E>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })
