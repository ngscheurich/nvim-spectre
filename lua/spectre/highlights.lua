local M = {}
local utils = require('spectre.utils')
local state = require('spectre.state')
local api = vim.api

M.hl_different_line = function(bufnr, namespace, search_query, replace_query, search, replace, lnum, padding)
    local diff = utils.different_text_col({
        search_text = search_query,
        replace_text = replace_query,
        search_line = search,
        replace_line = replace,
        padding = padding or 0
    })
    if diff then
        for _, value in pairs(diff.input) do
            api.nvim_buf_add_highlight(bufnr, namespace,state.user_config.highlight.search , lnum, value[1], value[2])
        end
        for _, value in pairs(diff.output) do
            api.nvim_buf_add_highlight(bufnr, namespace, state.user_config.highlight.replace, lnum + 1, value[1], value[2])
        end
    end

end

return M
