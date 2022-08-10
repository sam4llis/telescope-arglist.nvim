local M = {}

local entry_display = require('telescope.pickers.entry_display')
local utils = require('telescope.utils')
local strings = require('plenary.strings')

-- TODO: Add local/global functionality here?
M.get_arglist = function ()

  -- TODO: We want some functionality here to pick whether we want the global or
  -- local arglist. However, if the local arglist does not exist, instead of
  -- defaulting to the global arglist like in vim.fn.argv(), I want to write an
  -- error message to the user along the lines of `Local argument list is empty`.
  --
  -- NOTE: For local, try something similar to the top one!
  -- local arglist = vim.fn.argv(-1, vim.fn.win_getid())
  local arglist = vim.fn.argv()

  -- Quit prematurely if the argument list is empty.
  if vim.tbl_isempty(arglist) then
    vim.api.nvim_err_writeln('[telescope-arglist.nvim] Argument list is empty')
    return
  end

  local results = {}
  for argnr, path in ipairs(arglist) do
    table.insert(results, {
      index = argnr,
      path = path,
    })
  end

  return results
end


M.get_display = function (opts)
  local opts = opts or {}

  -- If the user has nvim-web-devicons installed, display icons alongside file
  -- paths, otherwise do not fill this section (width = 0).
  local icon = { type = nil, hl = nil, width = 0 }
  if not opts.disable_devicons then
    icon.type, icon.hl = utils.get_devicons(opts.path, opts.disable_devicons)
    icon.width = strings.strdisplaywidth(icon.type)
  end

  -- TODO: Add brackets around {}?
  local displayer = entry_display.create({
    separator = ' ',
    items = {
      { width = strings.strdisplaywidth(vim.fn.argc()) }, -- Get the display width of the maximum arglist index.
      { width = 1 },
      { width = icon.width },
      { remaining = true },
    },
  })

  local cwd = vim.fn.expand(opts.cwd or vim.loop.cwd())
  local argpath = utils.transform_path(opts, opts.path)

  return displayer({
    { opts.index, 'TelescopeResultsNumber' },
    { ' ' },
    { icon.type, icon.hl },
    { argpath },
  })

end

return M
