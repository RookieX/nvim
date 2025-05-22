-- treesitter
return {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        require("nvim-treesitter.configs").setup({
            highlight = {
                enable = true,
            },

            incremental_selection = {
                enable = true,
            },

            indent = {
                enable = true,
            }
        })
    end
}
