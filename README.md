# status-lsp
LSP component sources for [status.nvim](https://github.com/shizukani-cp/status.nvim).

| Source | Description | Example Output |
|:---|:---|:---|
| `status()` | Active LSP client names | ` [lua_ls,pyright]` |
| `diagnostics()` | Diagnostic counts with icons | ` 1  3` |

## Usage
```lua
local status = require("status.core")
local lsp = require("status.lsp")

status.setup({
    components = {
        left = {
            lsp.diagnostics,
            " ",
            lsp.status,
        },
    }
})
```
## Requirements
These components require [Nerd Fonts](https://www.nerdfonts.com/) for icon rendering.
