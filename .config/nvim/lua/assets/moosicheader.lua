local api = vim.api
local utils = require("dashboard.utils")

local function format_header(version, font)
	-- Set the font dynamically using the font parameter
	local command
	if version == "day" then
		command = string.format("figlet -f %s $(date '+%%A')", font)
	else
		command = string.format("figlet -f %s 'MoosicVIM'", font)
	end

	local handle = io.popen(command)
	if not handle then
		return { "Error: Failed to execute figlet command." }
	end

	local result = handle:read("*a")
	handle:close()

	-- Split the result into lines and store them in a table
	local formatted_header = {}
	table.insert(formatted_header, "")
	for line in result:gmatch("[^\r\n]+") do
		table.insert(formatted_header, line)
	end
	return formatted_header
end

local function default_header(config)
	local font = config.week_header.font -- Retrieve the font path from the config
	local header = format_header("default", font)

	return header
end

local function week_header(concat, append, config)
	local font = config.week_header.font -- Retrieve the font path from the config
	local tbl = format_header("day", font)
	table.insert(tbl, os.date("%Y-%m-%d %H:%M:%S ") .. (concat or ""))
	if append then
		vim.list_extend(tbl, append)
	end
	table.insert(tbl, "")
	return tbl
end

local function generate_header(config)
	if not vim.bo[config.bufnr].modifiable then
		vim.bo[config.bufnr].modifiable = true
	end
	if not config.command then
		local header = config.week_header
				and config.week_header.enable
				and week_header(config.week_header.concat, config.week_header.append, config)
			or (config.header or default_header(config))
		api.nvim_buf_set_lines(config.bufnr, 0, -1, false, utils.center_align(header))

		for i, _ in ipairs(header) do
			vim.api.nvim_buf_add_highlight(config.bufnr, 0, "DashboardHeader", i - 1, 0, -1)
		end
		return
	end

	local empty_table = utils.generate_empty_table(config.file_height + 4)
	api.nvim_buf_set_lines(config.bufnr, 0, -1, false, utils.center_align(empty_table))
	local preview = require("dashboard.preview")
	preview:open_preview({
		width = config.file_width,
		height = config.file_height,
		cmd = config.command .. " " .. config.file_path,
	})
end

return {
	generate_header = generate_header,
}
