-- Extract embedded or external album artwork for other scripts.
-- Requires: ffmpeg and ffprobe
--
-- Output: /tmp/mpv-cover-art.jpg
-- Property: user-data/album-art-path

local mp = require("mp")
local utils = require("mp.utils")

local OUTPUT = "/tmp/mpv-cover-art.jpg"
local TEMP = "/tmp/mpv-cover-art.tmp.jpg"

local COVER_FILES = {
	"cover.jpg",
	"cover.png",
	"folder.jpg",
	"folder.png",
	"front.jpg",
	"front.png",
	"album.jpg",
	"album.png",
}

local function run(args)
	return mp.command_native({
		name = "subprocess",
		args = args,
		capture_stdout = true,
		capture_stderr = true,
		playback_only = false,
	})
end

local function exists(path)
	local f = io.open(path, "rb")
	if f then
		f:close()
		return true
	end
	return false
end

local function publish(path)
	os.remove(OUTPUT)

	if os.rename(TEMP, OUTPUT) then
		mp.set_property("user-data/album-art-path", OUTPUT)
		mp.msg.info("Album art saved: " .. OUTPUT)
		return true
	end

	mp.msg.error("Could not move extracted album art")
	return false
end

local function extract_embedded(filename)
	-- Find streams marked as attached pictures.
	local probe = run({
		"ffprobe",
		"-v",
		"error",
		"-select_streams",
		"v",
		"-show_entries",
		"stream=index:stream_disposition=attached_pic",
		"-of",
		"json",
		filename,
	})

	if not probe or probe.status ~= 0 then
		return false
	end

	local data = utils.parse_json(probe.stdout or "")
	if not data or not data.streams then
		return false
	end

	for _, stream in ipairs(data.streams) do
		if stream.disposition and stream.disposition.attached_pic == 1 then
			os.remove(TEMP)

			local result = run({
				"ffmpeg",
				"-nostdin",
				"-v",
				"error",
				"-y",
				"-i",
				filename,
				"-map",
				"0:" .. tostring(stream.index),
				"-frames:v",
				"1",
				"-q:v",
				"2",
				TEMP,
			})

			if result and result.status == 0 and exists(TEMP) then
				mp.msg.info("Extracted embedded artwork")
				return publish(TEMP)
			end
		end
	end

	return false
end

local function extract_external(directory)
	for _, name in ipairs(COVER_FILES) do
		local cover = utils.join_path(directory, name)

		if exists(cover) then
			os.remove(TEMP)

			local result = run({
				"ffmpeg",
				"-nostdin",
				"-v",
				"error",
				"-y",
				"-i",
				cover,
				"-frames:v",
				"1",
				"-q:v",
				"2",
				TEMP,
			})

			if result and result.status == 0 and exists(TEMP) then
				mp.msg.info("Using external artwork: " .. cover)
				return publish(TEMP)
			end
		end
	end

	return false
end

local function extract_artwork()
	local filename = mp.get_property("path")

	if not filename or filename:match("^%a[%w+.-]*://") then
		return
	end

	local directory = utils.split_path(filename)

	if directory == "" then
		directory = mp.get_property("working-directory") or "."
	end

	-- Remove stale artwork so notifications don't show
	-- the previous song's cover.
	os.remove(OUTPUT)
	os.remove(TEMP)
	mp.set_property("user-data/album-art-path", "")

	-- Embedded artwork takes priority.
	if extract_embedded(filename) then
		return
	end

	-- Fall back to conventional external cover filenames.
	extract_external(directory)
end

mp.register_event("file-loaded", extract_artwork)

mp.register_event("end-file", function()
	os.remove(TEMP)
	os.remove(OUTPUT)
	mp.set_property("user-data/album-art-path", "")
end)
