-- Check if required dependencies are installed.
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

return require('telescope').register_extension {
  exports = {
    arglist = require('telescope-arglist').arglist,
  },
}
