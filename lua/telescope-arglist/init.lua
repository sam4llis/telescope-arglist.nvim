local M = {}

local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values

local Path = require('plenary.path')

M.arglist = function (opts)
  local opts = opts or {}

  -- Get path, index, and flags for arguments in the argument list.
  local results = require('telescope-arglist.utils').get_arglist()

  -- Quit prematurely if the argument list is empty.
  if not results then return end

  pickers.new(opts, {
    prompt_title = string.format('Global Argument List'),
    finder = finders.new_table {
      results = results,
      entry_maker = function (entry)
        return {
          value = entry,
          display = require('telescope-arglist.utils').get_display,
          ordinal = entry.index .. ': ' .. Path:new(entry.path):normalize(cwd),
          path = entry.path,
        }
    end,
    },
    previewer = conf.grep_previewer(opts),
    sorter = conf.generic_sorter(opts),
  }):find()
end

return M
