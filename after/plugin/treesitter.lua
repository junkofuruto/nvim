require'nvim-treesitter.configs'.setup {
	ensure_installed = { 
		'bash', 'c', 'c_sharp', 'cpp', 'css', 'csv', 'dockerfile',
		'gitattributes', 'gitcommit', 'gitignore', 'go', 'nasm',
		'php', 'python', 'rust', 'typescript', 'lua'
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}
