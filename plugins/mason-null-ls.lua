return {
    -- overrides `require("mason-null-ls").setup(...)`
    automatic_installation = true,
    ensure_installed = {
        -- Bash
        "beutysh",
        -- Python
        "pylint",
        "reorder-python-imports",
        "yapf",
        -- Git
        "gitlint",
        -- Lua
        "stylua",
        "luacheck",
        -- Other
        "prettier",
    },
    -- setup_handlers = {}
}
