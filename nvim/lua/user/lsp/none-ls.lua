return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        -- import null-ls plugin
        local null_ls = require("null-ls")
        local null_ls_utils = require("null-ls.utils")

        -- for conciseness
        local formatting = null_ls.builtins.formatting -- to setup formatters
        local diagnostics = null_ls.builtins.diagnostics -- to setup linters

        -- to setup format on save
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        -- configure null_ls
        null_ls.setup({
            -- add package.json as identifier for root (for typescript monorepos)
            root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),

            -- setup formatters & linters
            sources = {
                -- C/C++
                -- run "~/.local/share/nvim/mason/bin/clang-format --style "{BasedOnStyle: llvm, IndentWidth: 4}" -dump-config > .clang-format" to setup style
                formatting.clang_format.with({
                    extra_args = { "--style", "{BasedOnStyle: llvm, IndentWidth: 4, PointerAlignment: Left}" },
                }),

                -- Python
                diagnostics.pylint.with({
                    diagnostics_postprocess = function(diagnostic)
                        diagnostic.code = diagnostic.message_id
                    end,
                }),
                formatting.isort,
                formatting.black,

                -- Web Development
                formatting.prettier,

                -- diagnostics.eslint_d,
                formatting.stylua, -- lua formatter
            },
        })
    end,
}
