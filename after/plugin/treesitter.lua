require'nvim-treesitter.configs'.setup {
  ensure_installed = { "typescript", "c", "lua", "vim", "vimdoc", "query", "javascript", },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
