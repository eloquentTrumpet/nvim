DIVIDER = "   "

function CMD(cmd)
	return table.concat({ "<Cmd>", cmd, "<CR>" })
end

function CMD_FUNC(name)
	return function(cmd)
		return table.concat({ "<Cmd>", name, " ", cmd, "<CR>" })
	end
end

function LABEL(plugin)
	return function(func)
		return table.concat({ plugin, DIVIDER, func })
	end
end
