-- Run: nvim --headless -u NONE -i NONE -n -l ~/.config/nvim/tests/html_treesitter.lua
-- Attach a UI so decoration-provider callbacks run, including embedded languages.
local config = vim.fn.expand("~/.config/nvim")
local guard = [[
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
local lazy = require("lazy")
local setup = lazy.setup
lazy.setup = function(opts)
    opts.checker = { enabled = false }
    opts.install = { missing = false }
    table.insert(opts.spec, { "rmagatti/auto-session", enabled = false })
    return setup(opts)
end
]]
local child = vim.fn.jobstart({
    vim.v.progpath, "--embed", "--headless", "-i", "NONE", "-n",
    "--cmd", "set nomodeline noundofile",
    "--cmd", "lua " .. guard,
    "-u", config .. "/init.lua",
}, { rpc = true })
assert(child > 0, "Could not start Neovim")
local function run(code, args)
    return vim.rpcrequest(child, "nvim_exec_lua", code, args or {})
end
local ok, err = pcall(function()
    vim.rpcrequest(child, "nvim_ui_attach", 100, 30, { rgb = true })
    if vim.env.NVIM_HTML_TEST_LEGACY == "1" then
        run([[package.loaded['nvim-treesitter.query_predicates'] = nil; require('nvim-treesitter.query_predicates')]])
    end
    run([[vim.cmd('enew!'); vim.api.nvim_buf_set_name(0, vim.fn.tempname() .. '.html'); vim.bo.filetype = 'html']])
    local cases = {
        { "module", '<script type="module">const x = 1;</script>', "javascript" },
        { "javascript", '<script type="text/javascript">const x = 1;</script>', "javascript" },
        { "ecmascript", '<script type="application/ecmascript">const x = 1;</script>', "javascript" },
        { "importmap", '<script type="importmap">{"imports": {"x": "/x.js"}}</script>', "json" },
        { "json", '<script type="application/ld+json">{"name": "test"}</script>', nil },
        { "style", '<style>body { color: red; }</style>', "css" },
        { "plain", '<div><section><p>Hello</p></section></div>', nil },
    }
    for _, case in ipairs(cases) do
        run([[
            local text, expected = ...
            vim.api.nvim_buf_set_lines(0, 0, -1, false, {text})
            local parser = vim.treesitter.get_parser(0, 'html')
            parser:parse(true)
            if expected then assert(parser:children()[expected], 'Missing injection: ' .. expected) end
            assert(vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()], 'Highlighter inactive')
            vim.cmd('redraw!')
        ]], { case[2], case[3] })
        print("PASS render HTML: " .. case[1])
    end
    run([[
        vim.api.nvim_buf_set_lines(0, 0, -1, false, {'<div>'})
        vim.cmd('normal! GoPROBE')
        assert(vim.fn.indent(2) == 2, 'Expected 2-space newline indent')
        vim.api.nvim_buf_set_lines(0, 0, -1, false, {'<div><section><p>Hello</p></section></div>'})
        vim.api.nvim_exec_autocmds('BufWritePre', {buffer = 0})
        assert(vim.api.nvim_buf_line_count(0) > 1, 'Prettier did not format HTML')
    ]])
    print("PASS HTML indent and Prettier")
    run([[
        assert(vim.wait(10000, function()
            local found = {}
            for _, client in ipairs(vim.lsp.get_clients({bufnr = 0})) do
                if client.initialized then found[client.name] = true end
            end
            return found.html and found.emmet_language_server
        end, 50), 'HTML LSP and Emmet did not attach')
        local mapping = vim.fn.maparg('gf', 'n', false, true)
        assert(mapping.desc == 'Format with Prettier', 'HTML formatting mapping missing')
        mapping.callback()
        vim.cmd('redraw!')
    ]])
    print("PASS HTML LSP, Emmet and gf formatting")
    local messages = run([[return vim.api.nvim_exec2('messages', {output = true}).output]])
    assert(not messages:find("Decoration provider", 1, true), messages)
    assert(not messages:find("Error", 1, true), messages)
    assert(not messages:find("stack traceback", 1, true), messages)
    print("PASS full configuration startup and UI redraw without errors")
end)
pcall(vim.rpcnotify, child, "nvim_command", "qa!")
vim.fn.jobwait({ child }, 3000)
if not ok then
    io.stderr:write(tostring(err) .. "\n")
    vim.cmd("cquit 1")
end
