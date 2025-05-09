require("eza-preview"):setup({
	level = 3,
	follow_symlinks = false,
	dereference = false,
})

-- local catppuccin_theme = require("yatline-catppuccin"):setup("mocha")
local gruvbox_theme = require("yatline-gruvbox-material"):setup({ mode = "dark", toughness = "hard" })
require("yatline"):setup({
	theme = gruvbox_theme,
	section_separator = { open = "", close = "" },
	part_separator = { open = "", close = "" },
	inverse_separator = { open = "", close = "" },

	style_a = {
		fg = "black",
		bg_mode = {
			normal = "white",
			select = "brightyellow",
			un_set = "brightred",
		},
	},
	style_b = { bg = "brightblack", fg = "brightwhite" },
	style_c = { bg = "black", fg = "brightwhite" },

	permissions_t_fg = "green",
	permissions_r_fg = "yellow",
	permissions_w_fg = "red",
	permissions_x_fg = "cyan",
	permissions_s_fg = "white",

	tab_width = 20,
	tab_use_inverse = false,

	selected = { icon = "󰻭", fg = "yellow" },
	copied = { icon = "", fg = "green" },
	cut = { icon = "", fg = "red" },

	total = { icon = "󰮍", fg = "yellow" },
	succ = { icon = "", fg = "green" },
	fail = { icon = "", fg = "red" },
	found = { icon = "󰮕", fg = "blue" },
	processed = { icon = "󰐍", fg = "green" },

	show_background = true,

	display_header_line = true,
	display_status_line = true,

	component_positions = { "header", "tab", "status" },

	header_line = {
		left = {
			section_a = {
				{ type = "line", custom = false, name = "tabs", params = { "left" } },
			},
			section_b = {
				{ type = "coloreds", custom = false, name = "symlink" },
			},
			section_c = {},
		},
		right = {
			section_a = {
				{ type = "string", custom = false, name = "date", params = { "%A, %d %B %Y" } },
			},
			section_b = {
				{ type = "string", custom = false, name = "date", params = { "%X" } },
			},
			section_c = {
				{ type = "coloreds", custom = false, name = "githead" },
			},
		},
	},

	status_line = {
		left = {
			section_a = {
				{ type = "string", custom = false, name = "tab_mode" },
			},
			section_b = {
				{ type = "string", custom = false, name = "hovered_size" },
			},
			section_c = {
				{ type = "string", custom = false, name = "hovered_path" },
				{ type = "coloreds", custom = false, name = "count" },
			},
		},
		right = {
			section_a = {
				{ type = "string", custom = false, name = "cursor_position" },
			},
			section_b = {
				{ type = "string", custom = false, name = "cursor_percentage" },
			},
			section_c = {
				{ type = "string", custom = false, name = "hovered_file_extension", params = { true } },
				{ type = "coloreds", custom = false, name = "permissions" },
			},
			section_d = {},
		},
	},
})

require("full-border"):setup({
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.ROUNDED,
})

-- For seeing time and size
function Linemode:size_and_mtime()
	local time = math.floor(self._file.cha.mtime or 0)
	if time == 0 then
		time = ""
	elseif os.date("%Y", time) == os.date("%Y") then
		time = os.date("%b %d %I:%M %p", time)
	else
		time = os.date("%b %d  %Y", time)
	end

	local size = self._file:size()
	return string.format("%s %s", size and ya.readable_size(size) or "-", time)
end

require("git"):setup()

-- require("yatline-githead"):setup()

require("yatline-githead"):setup({
	show_branch = true,
	branch_prefix = "on",
	prefix_color = "white",
	branch_color = "blue",
	branch_symbol = "",
	branch_borders = "()",

	commit_color = "bright magenta",
	commit_symbol = "@",

	show_behind_ahead = true,
	behind_color = "bright magenta",
	behind_symbol = "⇣",
	ahead_color = "bright magenta",
	ahead_symbol = "⇡",

	show_stashes = true,
	stashes_color = "bright magenta",
	stashes_symbol = "$",

	show_state = true,
	show_state_prefix = true,
	state_color = "red",
	state_symbol = "~",

	show_staged = true,
	staged_color = "bright yellow",
	staged_symbol = "+",

	show_unstaged = true,
	unstaged_color = "bright yellow",
	unstaged_symbol = "!",

	show_untracked = true,
	untracked_color = "blue",
	untracked_symbol = "?",
})

-- Show symlink in the status bar
Status:children_add(function(self)
	local h = self._current.hovered
	if h and h.link_to then
		return " -> " .. tostring(h.link_to)
	else
		return ""
	end
end, 3300, Status.LEFT)

-- Yatline symlink
require("yatline-symlink"):setup()

-- Vim relative motions plugin
-- ~/.config/yazi/init.lua
require("relative-motions"):setup({ show_numbers = "relative", show_motion = true, enter_mode = "first" })
