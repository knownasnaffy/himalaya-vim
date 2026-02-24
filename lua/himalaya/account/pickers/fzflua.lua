local M = {}

local fzf_lua = require("fzf-lua")

M.select = function(cb, accounts)
	local account_names = {}
	for _, item in ipairs(accounts) do
		table.insert(account_names, item.name)
	end

	local opts = {}
	opts.prompt = "Accounts> "
	opts.actions = {
		["default"] = function(selected)
			vim.fn[cb](selected[1])
		end,
	}
	fzf_lua.fzf_exec(account_names, opts)
end

return M
