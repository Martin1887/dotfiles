local wezterm = require("wezterm")
local act = wezterm.action

-- Show which key table is active in the status area
wezterm.on("update-right-status", function(window, pane)
	local name = window:active_key_table()
	if name then
		name = "TABLE: " .. name
	end
	window:set_right_status(name or "")
end)

return {
	keys = {
		-- Vim-like panes operations
		{ key = "h", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Left") },
		{ key = "h", mods = "SHIFT|ALT", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "l", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Right") },
		{ key = "l", mods = "SHIFT|ALT", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "k", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Up") },
		{ key = "k", mods = "SHIFT|ALT", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "j", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Down") },
		{ key = "j", mods = "SHIFT|ALT", action = act.AdjustPaneSize({ "Down", 1 }) },
		-- Split with Ctrl+Shift+r and vertical split with Ctrl+Shift+d
		{ key = "d", mods = "SHIFT|CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "r", mods = "SHIFT|CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		-- Scroll by line with Shift+up/down
		{ key = "UpArrow", mods = "SHIFT", action = act.ScrollByLine(-1) },
		{ key = "DownArrow", mods = "SHIFT", action = act.ScrollByLine(1) },
	},

	color_scheme = "MaterialDark",
	colors = {
		selection_fg = "none",
		selection_bg = "rgba(87% 26% 26% 40%)",
		cursor_border = "#d7bb15",
		cursor_bg = "#d7bb15",
		cursor_fg = "#000000",
		compose_cursor = "#ff0000",
		background = "#000000",
		ansi = { "#212121", "#b7141f", "#457b24", "#f6981e", "#4060bb", "#8760aa", "#0e717c", "#efefef" },
		brights = { "#424242", "#e83b3f", "#7aba3a", "#eecc26", "#54a4f3", "#aa4dbc", "#26bbd1", "#d9d9d9" },
	},
	use_fancy_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	scrollback_lines = 20000,
	font = wezterm.font("FiraCode Nerd Font Ret"),
	warn_about_missing_glyphs = false,
}
