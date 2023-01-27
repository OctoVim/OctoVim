require('rose-pine').setup({
	--- @usage 'main' | 'moon'
	dark_variant = 'main',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = false,
	disable_italics = false,

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		background = 'base',
		panel = 'surface',
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'subtle',

		error = 'love',
		hint = 'iris',
		info = 'foam',
		warn = 'gold',

		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		}
		-- or set all headings at once
		-- headings = 'subtle'
	},

	-- Change specific vim highlight groups
	highlight_groups = {
		ColorColumn = { bg = 'rose' }
	}
})

-- setup must be called before loading
local colorscheme = "rose-pine"

-- Transparent
-- vim.api.nvim_create_autocmd("ColorScheme", {
-- 	pattern = "*",
-- 	callback = function()
-- 		local hl_groups = {
-- 			"Normal",
-- 			"SignColumn",
-- 			"NormalNC",
-- 			"TelescopeBorder",
-- 			"NvimTreeNormal",
-- 			"EndOfBuffer",
-- 			"MsgArea",
-- 		}
-- 		for _, name in ipairs(hl_groups) do
-- 			vim.cmd(string.format("highlight %s ctermbg=none guibg=none", name))
-- 		end
-- 	end,
-- })

vim.opt.fillchars = "eob: "

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
