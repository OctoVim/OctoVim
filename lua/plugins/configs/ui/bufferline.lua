local status_ok, bl = pcall(require, "bufferline")
if not status_ok then
	return
end

bl.setup({
	options = {
		close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		offsets = { { filetype = "NeoTree", text = "", padding = 1 } },
		separator_style = "thick", -- | "thick" | "thin" | { 'any', 'any' },
		color_icons = true,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
		always_show_bufferline = false,
	},
	highlights = {
		background = {
			italic = true,
			fg = "#CDD6F4",
		},
		buffer_selected = {
			bold = true,
		},
	},
})
