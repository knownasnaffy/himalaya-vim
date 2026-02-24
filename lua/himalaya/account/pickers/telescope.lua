local M = {}

local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local sorters = require('telescope.sorters')

M.select = function(cb, accounts)
  pickers.new {
    results_title = 'Accounts',
    finder = finders.new_table({
      results = accounts,
      entry_maker = function(entry) return {
        value = entry.name,
        display = entry.name,
        ordinal = entry.name,
      } end,
    }),
    sorter = sorters.get_generic_fuzzy_sorter(),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        vim.fn[cb](selection.display)
      end)

      return true
    end,
  }:find()
end

return M
