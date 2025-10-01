-- lua/lsp.lua

-- Példa: Python és C/C++ LSP szerverek konfigurációja
local servers = {
  pyright = {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_dir = vim.fs.dirname(vim.fs.find({"pyrightconfig.json", ".git"}, {upward=true})[1] or vim.loop.cwd()),
  },
  clangd = {
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = vim.fs.dirname(vim.fs.find({".clangd", ".git"}, {upward=true})[1] or vim.loop.cwd()),
  },
}

-- Aktiválás a Neovim 0.11 API-val
for name, config in pairs(servers) do
  vim.lsp.enable({name}, config)
end

