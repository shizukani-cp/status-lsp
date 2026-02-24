local M = {}

function M.status()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if #clients == 0 then
        return ""
    end

    local names = {}
    for _, client in ipairs(clients) do
        table.insert(names, client.name)
    end
    return " [" .. table.concat(names, ",") .. "]"
end

function M.diagnostics()
    local levels = {
        error = vim.diagnostic.severity.ERROR,
        warn = vim.diagnostic.severity.WARN,
        info = vim.diagnostic.severity.INFO,
        hint = vim.diagnostic.severity.HINT,
    }

    local res = {}
    local symbols = { error = " ", warn = " ", info = " ", hint = " " }

    for label, level in pairs(levels) do
        local count = #vim.diagnostic.get(0, { severity = level })
        if count > 0 then
            table.insert(res, symbols[label] .. count)
        end
    end

    return #res > 0 and table.concat(res, " ") or ""
end

return M
