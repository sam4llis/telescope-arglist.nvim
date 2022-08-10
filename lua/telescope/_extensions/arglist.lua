-- Check if the user has the required Neovim version.
if vim.fn.has('nvim-0.7.0') ~= 1 then
  vim.api.nvim_err_writeln('The plugin `telescope-arglist.nvim` requires Neovim v0.7.0 or higher.')
  return
end

-- Check if the user has the required dependencies installed.
local has_telescope, telescope = pcall(require, 'telescope')
local has_plenary, plenary = pcall(require, 'plenary')

if not has_telescope then
  vim.api.nvim_err_writeln('The plugin telescope-arglist.nvim requires nvim-telescope/telescope.nvim')
  return
end

if not has_plenary then
  vim.api.nvim_err_writeln('The plugin telescope-arglist.nvim requires nvim-lua/plenary.nvim')
  return
end

-- Register the extension.
return require('telescope').register_extension({
  exports = {
    arglist = require('telescope-arglist').arglist,
  },
})
