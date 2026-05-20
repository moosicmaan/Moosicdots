local vars = require("C.vars")
local MOD = vars.MOD
---- SCRATCH RULES ----
hl.workspace_rule({ workspace = "special:S-term", on_created_empty = vars.my_term .. " --app-id=Sterm" })
hl.workspace_rule({ workspace = "special:S-files", on_created_empty = vars.my_term .. " --app-id=Sfiles yazi" })
hl.workspace_rule({ workspace = "special:S-monitor", on_created_empty = vars.my_term .. " --app-id=Smonitor btop" })
hl.workspace_rule({ workspace = "special:S-moosic", on_created_empty = vars.my_term .. " --app-id=Smoosic pianobar" })
hl.workspace_rule({ workspace = "special:S-audio", on_created_empty = vars.my_term .. " --app-id=Saudio wiremix" })
hl.workspace_rule({ workspace = "special:S-bluet", on_created_empty = vars.my_term .. " --app-id=Sbluet bluetui" })
hl.workspace_rule({ workspace = "special:S-vial", on_created_empty = "Vial" })
hl.workspace_rule({ workspace = "special:S-notes", on_created_empty = "obsidian" })

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
	size = { 1300, 900 },
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
hl.bind(MOD .. " + ALT + D", hl.dsp.workspace.toggle_special("S-term"))
hl.bind(MOD .. " + ALT + H", hl.dsp.workspace.toggle_special("S-files"))
hl.bind(MOD .. " + ALT + S", hl.dsp.workspace.toggle_special("S-monitor"))
hl.bind(MOD .. " + ALT + M", hl.dsp.workspace.toggle_special("S-moosic"))
hl.bind(MOD .. " + ALT + X", hl.dsp.workspace.toggle_special("S-audio"))
hl.bind(MOD .. " + ALT + B", hl.dsp.workspace.toggle_special("S-bluet"))
hl.bind(MOD .. " + ALT + V", hl.dsp.workspace.toggle_special("S-vial"))
hl.bind(MOD .. " + ALT + O", hl.dsp.workspace.toggle_special("S-notes"))
hl.bind(MOD .. " + ALT + T", hl.dsp.workspace.toggle_special("magic"))
hl.bind(MOD .. " + SHIFT + T", hl.dsp.window.move({ workspace = "special:magic" }))
