-- treesitter
return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    config = function()
        -- The master branch still expects single captures; Nvim 0.12 passes lists.
        if vim.fn.has("nvim-0.12") == 1 then
            require("nvim-treesitter.query_predicates")
            vim.treesitter.query.add_directive("set-lang-from-mimetype!", function(match, _, source, predicate, metadata)
                local nodes = match[predicate[2]]
                local node = nodes and nodes[#nodes]
                if not node then
                    return
                end

                local mime = vim.treesitter.get_node_text(node, source)
                local languages = {
                    importmap = "json",
                    module = "javascript",
                    ["application/ecmascript"] = "javascript",
                    ["text/ecmascript"] = "javascript",
                }
                metadata["injection.language"] = languages[mime] or mime:match("[^/]+$")
            end, { force = true })
        end

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
