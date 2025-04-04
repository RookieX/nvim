return {
    'mrjones2014/legendary.nvim',
    -- since legendary.nvim handles all your keymaps/commands,
    -- its recommended to load legendary.nvim before other plugins
    priority = 10000,
    lazy = false,
    -- sqlite is only needed if you want to use frecency sorting
    -- dependencies = { 'kkharji/sqlite.lua' }
    opts = {
        keymaps = {
            -- NvimTree
            { '<F1>', ':NvimTreeToggle<CR>', description = 'Toggle NvimTree', opts = { silent = true } },
            { '<F3>', ':NvimTreeFindFile<CR>', description = 'Find file in NvimTree', opts = { silent = true } },

            -- Telescope
            { '<C-T>', ':Telescope find_files hidden=true<CR>', description = 'Find files', opts = { silent = true } },
            -- { '<C-L>', ':Telescope live_grep<CR>',              description = 'Live Grep',  opts = { silent = true } },
            { '<C-L>', function() require("telescope").extensions.live_grep_args.live_grep_args() end, description = 'Live Grep Args',  opts = { silent = true } },
            { '<leader>tt', ':Telescope ',              description = 'Telescope Command',  opts = { silent = false } },
            { '<leader>tk', ':Telescope keymaps<CR>',              description = 'Keymaps',  opts = { silent = true } },
            { '<leader>tb', ':Telescope buffers<CR>',              description = 'Buffers',  opts = { silent = true } },
            { '<leader>ts', ':Telescope session-lens<CR>',              description = 'Sessoins',  opts = { silent = true } },
            { '<leader>tf', ':Telescope grep_string<CR>',              description = 'Grep string',  opts = { silent = true } },

            -- Bufferline
            { 'gp', ':BufferLinePick<CR>',       description = 'Pick buffer', opts = { silent = true } },
            { 'gq', ':BufferLinePickClose<CR>', description = 'Close buffer', opts = { silent = true } },
            { 'gt', ':BufferLineCycleNext<CR>', description = 'Next buffer', opts = { silent = true } },
            { 'gT', ':BufferLineCyclePrev<CR>', description = 'Prev buffer', opts = { silent = true } },

            -- ToggleTerm
            { '<leader>f', ':ToggleTerm direction=float<CR>',      description = 'Float terminal', opts = { silent = true } },
            { '<leader>h', ':ToggleTerm direction=horizontal<CR>', description = 'Horizontal terminal', opts = { silent = true } },
            { '<leader>v', ':ToggleTerm direction=vertical<CR>',   description = 'Vertical terminal', opts = { silent = true } },

            -- Scissors
            { '<leader>se', function() require("scissors").editSnippet() end, description = 'Edit snippet', opts = { silent = true } },
            { '<leader>sa', function() require("scissors").addNewSnippet() end, description = 'Add new snippet', opts = { silent = true } },

            -- git
            { '<leader>gb', function() require("gitsigns").blame() end, description = 'Git blame', opts = { silent = true } },
        }
    }
}
