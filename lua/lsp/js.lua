local capabilities = require("lsp.capabilities").capabilities()
local prettier_filetypes = {
    html = true,
    javascript = true,
    javascriptreact = true,
    typescript = true,
    typescriptreact = true,
}

local function prettier_command(bufnr)
    local root = vim.fs.root(bufnr, { "package.json", ".prettierrc", ".prettierrc.json", ".prettierrc.js" })
    if root then
        local local_prettier = vim.fs.joinpath(root, "node_modules", ".bin", "prettier")
        if vim.fn.executable(local_prettier) == 1 then
            return local_prettier
        end
    end

    local global_prettier = vim.fn.exepath("prettier")
    return global_prettier ~= "" and global_prettier or nil
end

local function format_with_prettier(bufnr)
    if not prettier_filetypes[vim.bo[bufnr].filetype] or not vim.bo[bufnr].modifiable then
        return
    end

    local prettier = prettier_command(bufnr)
    if not prettier then
        return
    end

    local result = vim.system(
        { prettier, "--stdin-filepath", vim.api.nvim_buf_get_name(bufnr) },
        { stdin = table.concat(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false), "\n"), text = true }
    ):wait()
    if result.code ~= 0 then
        vim.notify("Prettier format failed: " .. (result.stderr or "unknown error"), vim.log.levels.WARN)
        return
    end

    local lines = vim.split(result.stdout, "\n", { plain = true })
    if lines[#lines] == "" then
        table.remove(lines)
    end
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
end

vim.lsp.config("ts_ls", {
    capabilities = capabilities,
})

vim.lsp.config("eslint", {
    capabilities = capabilities,
})

vim.lsp.config("emmet_language_server", {
    capabilities = capabilities,
    -- React projects can also keep JSX in .js files.
    filetypes = vim.list_extend(
        vim.deepcopy(vim.lsp.config.emmet_language_server.filetypes),
        { "javascript" }
    ),
    init_options = {
        includeLanguages = {
            javascript = "javascriptreact",
        },
        showAbbreviationSuggestions = true,
        showExpandedAbbreviation = "always",
        showSuggestionsAsSnippets = true,
        syntaxProfiles = {
            javascriptreact = "jsx",
            typescriptreact = "jsx",
        },
    },
})

vim.lsp.enable({ "ts_ls", "eslint", "emmet_language_server" })

local function use_typescript_indent(args)
    local filetype = vim.bo[args.buf].filetype
    if not vim.tbl_contains({ "javascript", "javascriptreact", "typescript", "typescriptreact" }, filetype) then
        return
    end
    -- The native TypeScript indenter also handles JavaScript. Load it for
    -- .js buffers before a TypeScript buffer has ever been opened.
    if vim.fn.exists("*GetTypescriptIndent") == 0 then
        vim.b[args.buf].did_indent = nil
        vim.cmd("runtime indent/typescript.vim")
    end
    if vim.fn.exists("*GetTypescriptIndent") == 1 then
        vim.bo[args.buf].indentexpr = "GetTypescriptIndent()"
        vim.bo[args.buf].expandtab = true
        vim.bo[args.buf].autoindent = true
        vim.bo[args.buf].smartindent = false
        vim.bo[args.buf].tabstop = 2
        vim.bo[args.buf].softtabstop = 2
        vim.bo[args.buf].shiftwidth = 2
    end
end

local indent_group = vim.api.nvim_create_augroup("react_typescript_indent", { clear = true })
vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "InsertEnter" }, {
    group = indent_group,
    callback = use_typescript_indent,
})

local group = vim.api.nvim_create_augroup("react_prettier", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = group,
    callback = function(args)
        format_with_prettier(args.buf)
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = group,
    callback = function(args)
        if not prettier_filetypes[vim.bo[args.buf].filetype] then
            return
        end

        local opts = { buffer = args.buf, silent = true, desc = "Format with Prettier" }
        vim.keymap.set("n", "gf", function()
            format_with_prettier(args.buf)
        end, opts)
        vim.keymap.set("n", "ƒ", function()
            format_with_prettier(args.buf)
        end, opts)
    end,
})
