return function(client, bufnr)
    if client.server_capabilities.DocumentRangeFormattingProvider then
        local is_available, lsp_format_modifications = pcall(require, "lsp-format-modifications")
        if is_available then
            lsp_format_modifications.attach(client, bufnr, { format_on_save = false })
        end
    end

    if client.server_capabilities.inlayHintProvider then
        local is_available, inlayhints = pcall(require, "lsp-inlayhints")
        if is_available then
            inlayhints.on_attach(client, bufnr)
            vim.keymap.set("n", "<leader>uH", function() inlayhints.toggle() end, { desc = "Toggle inlay hints" })
            vim.cmd("hi! link LspInlayHint Comment")
        end
    end

    -- local is_available, lsp_signature = pcall(require, "lsp_signature")
    -- if is_available then
    --     lsp_signature.on_attach({
    --         bind = true, -- This is mandatory, otherwise border config won't get registered.
    --         handler_opts = {
    --             border = "rounded",
    --         },
    --     }, bufnr)
    -- end
end
