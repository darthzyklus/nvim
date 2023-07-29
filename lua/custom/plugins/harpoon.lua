return {
	{
		'ThePrimeagen/harpoon',
		config = function()
			local nmap = function(keys, func, desc)
				vim.keymap.set('n', keys, func, { noremap = true, silent = true, desc = desc })
			end

			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")

			nmap("<leader>ha", function() mark.add_file() end, "Add harpoon file")
			nmap("<leader>1", function() ui.nav_file(1) end, "Harpoon to 1st file")
			nmap("<leader>2", function() ui.nav_file(2) end, "Harpoon to 2nd file")
			nmap("<leader>3", function() ui.nav_file(3) end, "Harpoon to 3th file")
			nmap("<leader>4", function() ui.nav_file(4) end, "Harpoon to 4th file")
			nmap("<leader>he", function() ui.toggle_quick_menu() end, "Toggle harpoon menu")
		end,
	}

}
