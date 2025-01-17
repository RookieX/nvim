-- status line
return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            disabled_filetypes = {       -- Filetypes to disable lualine for.
                statusline = { 'NvimTree' }, -- only ignores the ft for statusline.
                tabline = { 'NvimTree' }, -- only ignores the ft for statusline.
                winbar = { 'NvimTree' }, -- only ignores the ft for winbar.
            },
            ignore_focus = { 'NvimTree' },
            globalstatus = true,
        },

        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff', 'diagnostics' },
            lualine_c = { { 'filename', path = 1 }, 'searchcount' },
            lualine_x = { 'encoding', 'fileformat', 'filetype', 'filesize' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
        },

        tabline = {
        },

        --winbar = {
        --    lualine_a = {},
        --    lualine_b = {},
        --    lualine_c = { { 'filename', path = 1 } },
        --    lualine_x = {},
        --    lualine_y = {},
        --    lualine_z = {}
        --},
    }
}
