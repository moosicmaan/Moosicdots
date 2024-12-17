local api = vim.api
local utils = require("dashboard.utils")

--------------------------------------
-- JDB->generate git report
-- local function get_git_list()
-- 	local command = "hub diff --stat -B -M -C"
-- 	local handle = io.popen(command)
-- 	if not handle then
-- 		return { "Error: Failed to execute hub command." }
-- 	end
--
-- 	local result = handle:read("*a") -- Read the entire output
-- 	handle:close()
--
-- 	-- Split the result into lines and store them in a table
-- 	local header = {}
-- 	table.insert(header, "")
-- 	for line in result:gmatch("[^\r\n]+") do
-- 		table.insert(header, line)
-- 	end
--
-- 	return header
-- end
--
-- local function git_list(config)
-- 	config.git = vim.tbl_extend("force", {
-- 		icon = " ",
-- 		limit = 0,
-- 		icon_hl = "DashboardGitIcon",
-- 		label = " Git Status:",
-- 		enable = vim.fn.isdirectory(".git") == 1,
-- 	}, config.git or {})
--
-- 	-- {
-- 	-- 	enabled = vim.fn.isdirectory(".git") == 1,
-- 	-- 	cmd = "hub diff --stat -B -M -C",
-- 	-- },
--
-- 	if not config.git.enable then
-- 		return {}, {}
-- 	end
--
-- 	local list = {
-- 		config.git.icon .. config.git.label,
-- 	}
--
-- 	local glist = get_git_list()
--
-- 	if #list == 1 then
-- 		table.insert(list, (" "):rep(3) .. " mpty files")
-- 	end
-- 	return list, groups
-- end
--------------------------------------
local function default_gitdiff()
	local command = "hub diff --stat -B -M -C"
	local handle = io.popen(command)
	if not handle then
		return { "Error: Failed to execute hub command." }
	end

	local result = handle:read("*a") -- Read the entire output
	handle:close()

	-- Split the result into lines and store them in a table
	local gitdiff = {}
	table.insert(gitdiff, "") -- First empty line
	table.insert(gitdiff, "  GIT diff(CWD)") -- Second line with icon

	-- Add 3 spaces to the rest of the lines
	for line in result:gmatch("[^\r\n]+") do
		table.insert(gitdiff, "    " .. line) -- Prepend 3 spaces
	end

	return gitdiff
end

local function no_git()
	local tbl = {}
	table.insert(tbl, "")
	table.insert(tbl, "  GIT diff(CWD)")
	table.insert(tbl, "     Not in a git project ")
	return tbl
end

local function generate_gitdiff(config)
	if not vim.bo[config.bufnr].modifiable then
		vim.bo[config.bufnr].modifiable = true
	end
	if not config.command then
		local gitdiff = config.no_git and config.no_git.enable and no_git(config.no_git.concat, config.no_git.append)
			or (config.gitdiff or default_gitdiff())
		-- local function insert_lines(buffer, lines)
		-- 	-- Get the total number of lines in the buffer
		-- 	local line_count = vim.api.nvim_buf_line_count(buffer)
		-- 	-- Append the new lines after the last line
		-- 	api.nvim_buf_set_lines(buffer, line_count, line_count, true, lines)
		-- end
		local function insert_lines_aligned(buffer, lines)
			-- Get the total number of lines in the buffer
			local line_count = api.nvim_buf_line_count(buffer)

			-- Get the last line's content to calculate indentation
			local last_line = api.nvim_buf_get_lines(buffer, line_count - 1, line_count, false)[1] or ""
			local indentation = last_line:match("^%s*") or "" -- Capture leading spaces

			-- Remove 3 spaces (or as many as available) from the indentation
			local adjusted_indentation = indentation:sub(1, #indentation - 3)

			-- Add the adjusted indentation to each line in `lines`
			local aligned_lines = vim.tbl_map(function(line)
				return adjusted_indentation .. line
			end, lines)

			-- Append the new lines after the last line
			api.nvim_buf_set_lines(buffer, line_count, line_count, true, aligned_lines)
		end

		insert_lines_aligned(0, gitdiff)
		return
	end

	local empty_table = utils.generate_empty_table(config.file_height + 4)
	api.nvim_buf_set_lines(config.bufnr, 0, -1, false, utils.element_align(empty_table))
	local preview = require("dashboard.preview")
	preview:open_preview({
		width = config.file_width,
		height = config.file_height,
		cmd = config.command .. " " .. config.file_path,
	})
end

return {
	generate_gitdiff = generate_gitdiff,
}
