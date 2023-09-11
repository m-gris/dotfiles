function ColorMyPencils(color)
	color = color or "rose-pine"
	-- color = "rose-pine"
	vim.cmd.colorscheme(color)
	
	-- set background to be transparent
	vim.api.nvim_set_hl(0, -- for the "global space", ie. for every window !
	                   "Normal", 
			   { bg = "none" })

	vim.api.nvim_set_hl(0, -- for the "global space", ie. for every window !
	                   "NormalFloat", 
			   { bg = "none" })
end

ColorMyPencils()
