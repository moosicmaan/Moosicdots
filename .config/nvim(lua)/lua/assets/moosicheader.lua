local api = vim.api
local utils = require("dashboard.utils")

local function week_ascii_text()
	return {
		["Monday"] = {
			"",
			"███╗   ███╗ ██████╗ ███╗   ██╗██████╗  █████╗ ██╗   ██╗",
			"████╗ ████║██╔═══██╗████╗  ██║██╔══██╗██╔══██╗╚██╗ ██╔╝",
			"██╔████╔██║██║   ██║██╔██╗ ██║██║  ██║███████║ ╚████╔╝ ",
			"██║╚██╔╝██║██║   ██║██║╚██╗██║██║  ██║██╔══██║  ╚██╔╝  ",
			"██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██████╔╝██║  ██║   ██║   ",
			"╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
			"",
		},
		["Tuesday"] = {
			"",
			"████████╗██╗   ██╗███████╗███████╗██████╗  █████╗ ██╗   ██╗",
			"╚══██╔══╝██║   ██║██╔════╝██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝",
			"   ██║   ██║   ██║█████╗  ███████╗██║  ██║███████║ ╚████╔╝ ",
			"   ██║   ██║   ██║██╔══╝  ╚════██║██║  ██║██╔══██║  ╚██╔╝  ",
			"   ██║   ╚██████╔╝███████╗███████║██████╔╝██║  ██║   ██║   ",
			"   ╚═╝    ╚═════╝ ╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
			"",
		},
		["Wednesday"] = {
			"",
			"██╗    ██╗███████╗██████╗ ███╗   ██╗███████╗███████╗██████╗  █████╗ ██╗   ██╗",
			"██║    ██║██╔════╝██╔══██╗████╗  ██║██╔════╝██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝",
			"██║ █╗ ██║█████╗  ██║  ██║██╔██╗ ██║█████╗  ███████╗██║  ██║███████║ ╚████╔╝ ",
			"██║███╗██║██╔══╝  ██║  ██║██║╚██╗██║██╔══╝  ╚════██║██║  ██║██╔══██║  ╚██╔╝  ",
			"╚███╔███╔╝███████╗██████╔╝██║ ╚████║███████╗███████║██████╔╝██║  ██║   ██║   ",
			" ╚══╝╚══╝ ╚══════╝╚═════╝ ╚═╝  ╚═══╝╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
			"",
		},
		["Thursday"] = {
			"",
			"████████╗██╗  ██╗██╗   ██╗██████╗ ███████╗██████╗  █████╗ ██╗   ██╗",
			"╚══██╔══╝██║  ██║██║   ██║██╔══██╗██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝",
			"   ██║   ███████║██║   ██║██████╔╝███████╗██║  ██║███████║ ╚████╔╝ ",
			"   ██║   ██╔══██║██║   ██║██╔══██╗╚════██║██║  ██║██╔══██║  ╚██╔╝  ",
			"   ██║   ██║  ██║╚██████╔╝██║  ██║███████║██████╔╝██║  ██║   ██║   ",
			"   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
			"",
		},
		["Friday"] = {
			"",
			"███████╗██████╗ ██╗██████╗  █████╗ ██╗   ██╗",
			"██╔════╝██╔══██╗██║██╔══██╗██╔══██╗╚██╗ ██╔╝",
			"█████╗  ██████╔╝██║██║  ██║███████║ ╚████╔╝ ",
			"██╔══╝  ██╔══██╗██║██║  ██║██╔══██║  ╚██╔╝  ",
			"██║     ██║  ██║██║██████╔╝██║  ██║   ██║   ",
			"╚═╝     ╚═╝  ╚═╝╚═╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
			"",
		},
		["Saturday"] = {
			"",
			"███████╗ █████╗ ████████╗██╗   ██╗██████╗ ██████╗  █████╗ ██╗   ██╗",
			"██╔════╝██╔══██╗╚══██╔══╝██║   ██║██╔══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝",
			"███████╗███████║   ██║   ██║   ██║██████╔╝██║  ██║███████║ ╚████╔╝ ",
			"╚════██║██╔══██║   ██║   ██║   ██║██╔══██╗██║  ██║██╔══██║  ╚██╔╝  ",
			"███████║██║  ██║   ██║   ╚██████╔╝██║  ██║██████╔╝██║  ██║   ██║   ",
			"╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
			"",
		},
		["Sunday"] = {
			"",
			"███████╗██╗   ██╗███╗   ██╗██████╗  █████╗ ██╗   ██╗",
			"██╔════╝██║   ██║████╗  ██║██╔══██╗██╔══██╗╚██╗ ██╔╝",
			"███████╗██║   ██║██╔██╗ ██║██║  ██║███████║ ╚████╔╝ ",
			"╚════██║██║   ██║██║╚██╗██║██║  ██║██╔══██║  ╚██╔╝  ",
			"███████║╚██████╔╝██║ ╚████║██████╔╝██║  ██║   ██║   ",
			"╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
			"",
		},
	}
end

-- local function default_header()
-- 	return {
-- 		"",
-- 		"███╗   ███╗ ██████╗  ██████╗ ███████╗██╗ ██████╗██╗   ██╗██╗███╗   ███╗ ",
-- 		"████╗ ████║██╔═══██╗██╔═══██╗██╔════╝██║██╔════╝██║   ██║██║████╗ ████║ ",
-- 		"██╔████╔██║██║   ██║██║   ██║███████╗██║██║     ██║   ██║██║██╔████╔██║ ",
-- 		"██║╚██╔╝██║██║   ██║██║   ██║╚════██║██║██║     ╚██╗ ██╔╝██║██║╚██╔╝██║ ",
-- 		"██║ ╚═╝ ██║╚██████╔╝╚██████╔╝███████║██║╚██████╗ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
-- 		"╚═╝     ╚═╝ ╚═════╝  ╚═════╝ ╚══════╝╚═╝ ╚═════╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
-- 		"",
-- 	}
-- end
local function default_header()
	-- local command = "hub diff --stat -B -M -C"
	local command = "figlet -f ~/.config/nvim/lua/assets/ansi_shadow.flf 'MoosicVIM'"
	-- local command = "figlet -f slant 'MoosicVIM'"
	local handle = io.popen(command)
	if not handle then
		return { "Error: Failed to execute figlet command." }
	end

	local result = handle:read("*a") -- Read the entire output
	handle:close()

	-- Split the result into lines and store them in a table
	local header = {}
	table.insert(header, "")
	for line in result:gmatch("[^\r\n]+") do
		table.insert(header, line)
	end

	return header
end

local function week_header(concat, append)
	local week = week_ascii_text()
	local daysoftheweek = { "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" }
	local day = daysoftheweek[os.date("*t").wday]
	local tbl = week[day]
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
				and week_header(config.week_header.concat, config.week_header.append)
			or (config.header or default_header())
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
