local api = vim.api
local utils = require("dashboard.utils")

-- -- JDB - something to try and get colors in git diff...look into baleia documentation
-- local function default_gitdiff()
-- 	local command = "hub diff --stat -B -M -C --color=always"
-- 	local handle = io.popen(command)
-- 	if not handle then
-- 		return { "Error: Failed to execute hub command." }
-- 	end
--
-- 	local result = handle:read("*a")
-- 	handle:close()
--
-- 	local lines = vim.split(result, "\n", { trimempty = true })
-- 	local gitdiff = { "", "  GIT Status:" }
-- 	for _, line in ipairs(lines) do
-- 		table.insert(gitdiff, "    " .. line)
-- 	end
--
-- 	return gitdiff
-- end

-- JDB ->original function before baleia
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
	table.insert(gitdiff, "  GIT Status:") -- Second line with icon

	-- Use vim.split to process the output into lines
	local lines = vim.split(result, "\n", { trimempty = true }) -- Split by newlines
	for _, line in ipairs(lines) do
		table.insert(gitdiff, "   " .. line) -- Prepend 3 spaces
	end

	return gitdiff
end

local function no_git()
	local tbl = {}
	table.insert(tbl, "")
	table.insert(tbl, "  GIT status:")
	table.insert(tbl, "     Not in a git project ")
	return tbl
end

-- -- JDB - something to try and get colors in git diff...look into baleia documentation
-- local function generate_gitdiff(config)
-- 	if not vim.bo[config.bufnr].modifiable then
-- 		vim.bo[config.bufnr].modifiable = true
-- 	end
--
-- 	local gitdiff = default_gitdiff()
--
-- 	-- Insert lines into the buffer
-- 	vim.api.nvim_buf_set_lines(config.bufnr, -1, -1, false, gitdiff)
--
-- 	-- Use Baleia to render ANSI sequences
-- 	local baleia = require("baleia").setup({})
-- 	local lines = vim.api.nvim_buf_get_lines(config.bufnr, 0, -1, false)
-- 	baleia.buf_set_lines(config.bufnr, 0, -1, false, lines)
-- end

-- JDB ->original function that indented the section
local function generate_gitdiff(config)
	if not vim.bo[config.bufnr].modifiable then
		vim.bo[config.bufnr].modifiable = true
	end

	if not config.command then
		local gitdiff = config.no_git and config.no_git.enable and no_git() or (config.gitdiff or default_gitdiff())

		local function insert_lines_aligned(buffer, lines)
			-- Get the total number of lines in the buffer
			local line_count = vim.api.nvim_buf_line_count(buffer)

			-- Get the last line's content to calculate indentation
			local last_line = vim.api.nvim_buf_get_lines(buffer, line_count - 1, line_count, false)[1] or ""
			local indentation = last_line:match("^%s*") or "" -- Capture leading spaces

			-- Remove 3 spaces (or as many as available) from the indentation
			local adjusted_indentation = indentation:sub(1, #indentation - 3)

			-- Add the adjusted indentation to each line in `lines`
			local aligned_lines = vim.tbl_map(function(line)
				return adjusted_indentation .. line
			end, lines)

			-- Append the new lines after the last line
			vim.api.nvim_buf_set_lines(buffer, line_count, line_count, true, aligned_lines)
			for i = line_count, line_count + #aligned_lines - 1 do
				vim.api.nvim_buf_add_highlight(buffer, -1, "DashboardProjectTitle", i, 20, 50)
			end

			-- Highlight lines starting from the 3rd one added
			for i = line_count + 2, line_count + #aligned_lines - 1 do
				vim.api.nvim_buf_add_highlight(buffer, -1, "Identifier", i, 29, 30)
				vim.api.nvim_buf_add_highlight(buffer, -1, "DashboardFiles", i, 31, 120)
			end
		end

		insert_lines_aligned(0, gitdiff)
		return
	end
end

return {
	generate_gitdiff = generate_gitdiff,
}
