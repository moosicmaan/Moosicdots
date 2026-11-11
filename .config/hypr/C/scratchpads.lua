----LOAD MODS ----
local vars = require("C.vars")
local MOD = vars.MOD

---- SCRATCH RULES ----
local workspace_programs = {
	["special:S-term"] = { vars.my_term .. " --app-id=Sterm" },
	["special:S-files"] = { vars.my_term .. " --app-id=Sfiles yazi" },
	["special:S-monitor"] = { vars.my_term .. " --app-id=Smonitor btop" },
	["special:S-moosic"] = { vars.my_term .. " --app-id=Smoosic pianobar" },
	["special:S-audio"] = { vars.my_term .. " --app-id=Saudio wiremix" },
	["special:S-bluet"] = { vars.my_term .. " --app-id=Sbluet bluetui" },
	["special:S-kbd"] = { "Vial" },
	["special:S-notes"] = { "obsidian" },
}
hl.on("workspace.created", function(ws)
	if not ws.is_empty then
		return
	end
	-- use programs associated with window id by default
	local program = ws.id and workspace_programs[tostring(ws.id)] or workspace_programs[ws.name]
	if program == nil then
		return
	end
	local cmd, provided_rules = table.unpack(program)
	-- shallow-copy the rules table so we can add the workspace to it
	local rules = {}
	if provided_rules ~= nil then
		for k, v in provided_rules do
			rules[k] = v
		end
	end
	-- force program to open on desired workspace, even if focus is moved to another
	-- workspace before the program window appears
	rules.workspace = (ws.id and tostring(ws.id) or ws.name) .. " silent"
	-- run it!
	hl.exec_cmd(cmd, rules)
end)

hl.window_rule({
	match = {
		class = "obsidian",
	},
	border_size = 4,
	-- dim_around = true,
	float = true,
	center = true,
	size = { 1800, 1000 },
})
hl.window_rule({
	match = {
		class = "Vial",
	},
	-- border_size = 4,
	dim_around = true,
	float = true,
	center = true,
	size = { 1800, 1000 },
})
hl.window_rule({
	match = {
		class = "Sterm",
	},
	-- border_size = 4,
	dim_around = true,
	float = true,
	center = true,
	size = { 1400, 1000 },
})
hl.window_rule({
	match = {
		class = "Sfiles",
	},
	-- border_size = 4,
	dim_around = true,
	float = true,
	center = true,
	size = { 1700, 900 },
})
hl.window_rule({
	match = {
		class = "Smonitor",
	},
	-- border_size = 4,
	dim_around = true,
	float = true,
	center = true,
	size = { 1500, 900 },
})
hl.window_rule({
	match = {
		class = "Saudio",
		"Sbluet",
	},
	-- border_size = 4,
	dim_around = true,
	float = true,
	center = true,
	size = { 900, 700 },
})
hl.window_rule({
	match = {
		class = "Sbluet",
	},
	-- border_size = 4,
	dim_around = true,
	float = true,
	center = true,
	size = { 900, 900 },
})
hl.window_rule({
	match = {
		class = "Smoosic",
	},
	-- border_size = 4,
	dim_around = true,
	float = true,
	center = true,
	size = { 800, 700 },
})

---- SCRATCH BINDS ----
hl.bind(MOD .. " + ALT + D", hl.dsp.workspace.toggle_special("S-term"), { description = "Terminal scratchpad" })
hl.bind(MOD .. " + ALT + H", hl.dsp.workspace.toggle_special("S-files"), { description = "File browser scratchpad" })
hl.bind(
	MOD .. " + ALT + S",
	hl.dsp.workspace.toggle_special("S-monitor"),
	{ description = "System monitor scratchpad" }
)
hl.bind(MOD .. " + ALT + M", hl.dsp.workspace.toggle_special("S-moosic"), { description = "Music scratchpad" })
hl.bind(MOD .. " + ALT + X", hl.dsp.workspace.toggle_special("S-audio"), { description = "Audio scratchpad" })
hl.bind(MOD .. " + ALT + B", hl.dsp.workspace.toggle_special("S-bluet"), { description = "Bluetooth scratchped" })
hl.bind(MOD .. " + ALT + V", hl.dsp.workspace.toggle_special("S-kbd"), { description = "Keyboard config scratchpad" })
hl.bind(MOD .. " + ALT + O", hl.dsp.workspace.toggle_special("S-notes"), { description = "Notetaking scratchpad" })
hl.bind(MOD .. " + ALT + J", hl.dsp.workspace.toggle_special("magic"), { description = "Toggle magic scratchped" })
hl.bind(
	MOD .. " + SHIFT + J",
	hl.dsp.window.move({ workspace = "special:magic" }),
	{ description = "Move window to magic scratchpad" }
)
