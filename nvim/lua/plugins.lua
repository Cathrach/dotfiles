return require("packer").startup(function()
	use 'wbthomason/packer.nvim'

	-- Behind the Scenes
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use {'neoclide/coc.nvim', branch = 'release'}

	-- Appearances
	use 'sainnhe/sonokai'
	use 'ryanoasis/vim-devicons'
	use 'norcalli/nvim-colorizer.lua'
	use 'itchyny/lightline.vim'

	-- Git!
	use 'airblade/vim-gitgutter'
	use 'tpope/vim-fugitive'

	-- Navigation
	use 'easymotion/vim-easymotion'
	use {'junegunn/fzf', run = './install --all'}
	use 'junegunn/fzf.vim'
    use { 'kyazdani42/nvim-tree.lua', cmd = 'NvimTreeToggle' }
	use 'preservim/tagbar'
    use 'ludovicchabant/vim-gutentags'

	-- Editing
	use 'tomtom/tcomment_vim'
	use 'tpope/vim-surround'
	
	-- Files
	use 'plasticboy/vim-markdown'
	use 'mzlogin/vim-markdown-toc'

	-- Productivity
	use {
    "vhyrro/neorg",
    config = function()
        require('neorg').setup {
            -- Tell Neorg what modules to load
            load = {
                ["core.defaults"] = {}, -- Load all the default modules
                ["core.norg.concealer"] = {}, -- Allows for use of icons
                ["core.norg.dirman"] = { -- Manage your directories with Neorg
                    config = {
                        workspaces = {
                            default = "~/neorg"
                        }
                    }
                }
            },
        }
    end,
    requires = "nvim-lua/plenary.nvim"
}
end)
