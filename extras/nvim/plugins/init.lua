local M = {}

function M.setup()
    require("lazy").setup({
        "folke/which-key.nvim",
		"sainnhe/sonokai",
		"sainnhe/edge",
		{
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v3.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
				-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
			}
		},
		{
			"nvim-treesitter/nvim-treesitter",
			config = function()
				require'nvim-treesitter.configs'.setup {
					-- A list of parser names, or "all" (the five listed parsers should always be installed)
					ensure_installed = { "c", "lua", "vim", "vimdoc" },
				  
					-- Install parsers synchronously (only applied to `ensure_installed`)
					sync_install = false,
				  
					-- Automatically install missing parsers when entering buffer
					-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
					-- auto_install = true,
				  
					-- List of parsers to ignore installing (or "all")
					-- ignore_install = { "javascript" },
				  
					---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
					-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
				  
					highlight = {
						enable = true,
					
						-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
						-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
						-- the name of the parser)
						-- list of language that will be disabled
						-- disable = { "c", "rust" },

						-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
						
						-- disable = function(lang, buf)
						-- 	local max_filesize = 100 * 1024 -- 100 KB
						-- 	local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						-- 	if ok and stats and stats.size > max_filesize then
						-- 		return true
						-- 	end
						-- end,
					
						-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
						-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
						-- Using this option may slow down your editor, and you may see some duplicate highlights.
						-- Instead of true it can also be a list of languages
						additional_vim_regex_highlighting = false,
					},
					indent = { enable = true }
				}
			end
		},
		{
			'windwp/nvim-autopairs',
			event = "InsertEnter",
			opts = {} -- this is equalent to setup({}) function
		},
		{
			'nvim-lualine/lualine.nvim',
			dependencies = { 'nvim-tree/nvim-web-devicons' },
		},
		"mgnsk/autotabline.nvim",
		{
			'nvimdev/dashboard-nvim',
			event = 'VimEnter',
			config = function()
			  require('dashboard').setup {
				-- config
			  }
			end,
			dependencies = { {'nvim-tree/nvim-web-devicons'}}
		},
		"folke/neodev.nvim",
		"williamboman/mason.nvim",
    	"williamboman/mason-lspconfig.nvim",
    	"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-vsnip",
		"hrsh7th/vim-vsnip",
		{
			'realprogrammersusevim/md-to-html.nvim',
			cmd = { 'MarkdownToHTML', 'NewMarkdownToHTML' },
		},
		{
			'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                              , branch = '0.1.x',
			dependencies = { 'nvim-lua/plenary.nvim' },
			config = function()
				local builtin = require('telescope.builtin')

				vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
				vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
				vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
				vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
			end
		},
		{
			"iamcco/markdown-preview.nvim",
			cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
			ft = { "markdown" },
			build = function() vim.fn["mkdp#util#install"]() end,
		},
		"ixru/nvim-markdown",
		{
			"brenton-leighton/multiple-cursors.nvim",
			version = "*",  -- Use the latest tagged version
			opts = {},  -- This causes the plugin setup function to be called
			keys = {
				{"<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n", "i"}},
				{"<C-j>", "<Cmd>MultipleCursorsAddDown<CR>"},
				{"<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n", "i"}},
				{"<C-k>", "<Cmd>MultipleCursorsAddUp<CR>"},
				{"<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = {"n", "i"}},
				{"<Leader>a", "<Cmd>MultipleCursorsAddBySearch<CR>", mode = {"n", "x"}},
				{"<Leader>A", "<Cmd>MultipleCursorsAddBySearchV<CR>", mode = {"n", "x"}},
			},
		},
		"kyazdani42/blue-moon",
		{
			'andersevenrud/nordic.nvim',
			config = function()
				require('nordic').colorscheme({})
			end
		},
		"Mofiqul/dracula.nvim",
		{
			"catppuccin/nvim",
			name = "catppuccin"
		},
		{
			'numToStr/Comment.nvim',
			opts = {
    			---Add a space b/w comment and the line
    			padding = true,
    			---Whether the cursor should stay at its position
    			sticky = true,
    			---Lines to be ignored while (un)comment
    			ignore = nil,
    			---LHS of toggle mappings in NORMAL mode
    			toggler = {
    			    ---Line-comment toggle keymap
    			    line = 'gcc',
    			    ---Block-comment toggle keymap
    			    block = 'gbc',
    			},
    			---LHS of operator-pending mappings in NORMAL and VISUAL mode
    			opleader = {
    			    ---Line-comment keymap
    			    line = 'gc',
    			    ---Block-comment keymap
    			    block = 'gb',
    			},
    			---LHS of extra mappings
    			extra = {
    			    ---Add comment on the line above
    			    above = 'gcO',
    			    ---Add comment on the line below
    			    below = 'gco',
    			    ---Add comment at the end of line
    			    eol = 'gcA',
    			},
    			---Enable keybindings
    			---NOTE: If given `false` then the plugin won't create any mappings
    			mappings = {
    			    ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
    			    basic = true,
    			    ---Extra mapping; `gco`, `gcO`, `gcA`
    			    extra = true,
    			},
    			---Function to call before (un)comment
    			pre_hook = nil,
    			---Function to call after (un)comment
    			post_hook = nil,
			},
			lazy = false,
		},
		{
    		"kylechui/nvim-surround",
    		config = function()
    		    require("nvim-surround").setup({
    		        -- Configuration here, or leave empty to use defaults
					keymaps = {
        				insert = "<C-g>s",
        				insert_line = "<C-g>S",
        				normal = "ys",
        				normal_cur = "yss",
        				normal_line = "yS",
        				normal_cur_line = "ySS",
        				visual = "S",
        				visual_line = "gS",
        				delete = "ds",
        				change = "cs",
        				change_line = "cS",
					},
    		    })
    		end
		},
		{
		  	'phaazon/hop.nvim',
		  	branch = 'v2', -- optional but strongly recommended
		  	config = function()
		  		-- you can configure Hop the way you like here; see :h hop-config
		  		require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
				vim.keymap.set("n", "<leader>hw", ":HopWord<CR>", {})
		  	end
		},
		{
  			"epwalsh/obsidian.nvim",
  			version = "*",  -- recommended, use latest release instead of latest commit
  			lazy = true,
  			ft = "markdown",
  			-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  			-- event = {
  			--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  			--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  			--   "BufReadPre path/to/my-vault/**.md",
  			--   "BufNewFile path/to/my-vault/**.md",
  			-- },
  			dependencies = {
  			  -- Required.
  			  "nvim-lua/plenary.nvim",
			
  			  -- see below for full list of optional dependencies 👇
				priority = 10000
  			},
		},
		{
			"NvChad/nvim-colorizer.lua",
			config = function()
				require("colorizer").setup {
					filetypes = { "*" },
					user_default_options = {
						RGB = true, -- #RGB hex codes
						RRGGBB = true, -- #RRGGBB hex codes
						names = true, -- "Name" codes like Blue or blue
						RRGGBBAA = false, -- #RRGGBBAA hex codes
						AARRGGBB = false, -- 0xAARRGGBB hex codes
						rgb_fn = false, -- CSS rgb() and rgba() functions
						hsl_fn = false, -- CSS hsl() and hsla() functions
						css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
						css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
						-- Available modes for `mode`: foreground, background,  virtualtext
						mode = "background", -- Set the display mode.
						-- Available methods are false / true / "normal" / "lsp" / "both"
						-- True is same as normal
						tailwind = false, -- Enable tailwind colors
						-- parsers can contain values used in |user_default_options|
						sass = { enable = false, parsers = { "css" }, }, -- Enable sass colors
						virtualtext = "■",
						-- update color values even if buffer is not focused
						-- example use: cmp_menu, cmp_docs
						always_update = false
					},
					-- all the sub-options of filetypes apply to buftypes
					buftypes = {},
				}
			end
		},
		{
			"ziontee113/color-picker.nvim",
    		config = function()
				local opts = { noremap = true, silent = true }

				vim.keymap.set("n", "<C-c>", "<cmd>PickColor<cr>", opts)
				vim.keymap.set("i", "<C-c>", "<cmd>PickColorInsert<cr>", opts)
				
				-- vim.keymap.set("n", "your_keymap", "<cmd>ConvertHEXandRGB<cr>", opts)
				-- vim.keymap.set("n", "your_keymap", "<cmd>ConvertHEXandHSL<cr>", opts)
				
				require("color-picker").setup({ -- for changing icons & mappings
					-- ["icons"] = { "ﱢ", "" },
					-- ["icons"] = { "ﮊ", "" },
					-- ["icons"] = { "", "ﰕ" },
					-- ["icons"] = { "", "" },
					-- ["icons"] = { "", "" },
					["icons"] = { "ﱢ", "" },
					["border"] = "rounded", -- none | single | double | rounded | solid | shadow
					["keymap"] = { -- mapping example:
						["U"] = "<Plug>ColorPickerSlider5Decrease",
						["O"] = "<Plug>ColorPickerSlider5Increase",
					},
					["background_highlight_group"] = "Normal", -- default
					["border_highlight_group"] = "FloatBorder", -- default
				  ["text_highlight_group"] = "Normal", --default
				})
				
				vim.cmd([[hi FloatBorder guibg=NONE]])
    		end,
		},
		})
--[ EO plugin list ]---lol-----
-------------------------------
	
--[ autopairs ]------
    local npairs = require("nvim-autopairs")
    local Rule = require('nvim-autopairs.rule')

    npairs.setup({
	check_ts = true,
	ts_config = {
	    lua = {'string'},-- it will not add a pair on that treesitter node
	    javascript = {'template_string'},
	    -- java = false,-- don't check treesitter on java
	}
    })

    local ts_conds = require('nvim-autopairs.ts-conds')


    -- press % => %% only while inside a comment or string
    npairs.add_rules({
      Rule("%", "%", "lua")
	:with_pair(ts_conds.is_ts_node({'string','comment'})),
      Rule("$", "$", "lua")
	:with_pair(ts_conds.is_not_ts_node({'function'}))
    })
--[ autopairs ]-------


--[ lualine ]---------
    require('lualine').setup {
        options = {
        icons_enabled = true,
        theme = 'edge',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
        },
        sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
        },
        inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
    }
--[ lualine ]---------

--[ lsp ]-------------
    require("lsp-setup").setup()
--[ lsp ]-------------

--[ autocompletion ]--
    local cmp = require'cmp'

    cmp.setup({
        snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
        },
        window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            -- ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            ['<tab>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
        },
        {
            { name = 'buffer' },
        })
    })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
--[ autocompletion ]--

--[ obsidian ]--------
	require("obsidian").setup({
		workspaces = {
			{
				name = "personal",
				path = "~/vaults/personal",
			},
			{
				name = "work",
				path = "~/vaults/work",
			},
			{
				name = "notes",
				path = "~/vaults/notes",
			},
		},
		note_id_func = function(title)
		    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
		    -- In this case a note with the title 'My new note' will be given an ID that looks
		    -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
		    local suffix = ""
		    if title ~= nil then
		      	-- If title is given, transform it into valid file name.
		      	suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
		    else
		      -- If title is nil, just add 4 random uppercase letters to the suffix.
		      	for _ = 1, 4 do
		        	suffix = suffix .. string.char(math.random(65, 90))
		    	end
		    end
			return tostring(os.time()) .. "-" .. suffix
		end,
		ui = {
		    enable = true,  -- set to false to disable all additional syntax features
		    update_debounce = 200,  -- update delay after a text change (in milliseconds)
		    -- Define how various check-boxes are displayed
		    checkboxes = {
		      -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
		      [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
		      ["x"] = { char = "", hl_group = "ObsidianDone" },
		      [">"] = { char = "", hl_group = "ObsidianRightArrow" },
		      ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
		      -- Replace the above with this if you don't have a patched font:
		      -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
		      -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },
		
		      -- You can also add more custom ones...
		    },
		    -- Use bullet marks for non-checkbox lists.
		    bullets = { char = "•", hl_group = "ObsidianBullet" },
		    external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
		    -- Replace the above with this if you don't have a patched font:
		    -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
		    reference_text = { hl_group = "ObsidianRefText" },
		    highlight_text = { hl_group = "ObsidianHighlightText" },
		    tags = { hl_group = "ObsidianTag" },
		    hl_groups = {
		      -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
		      ObsidianTodo = { bold = true, fg = "#f78c6c" },
		      ObsidianDone = { bold = true, fg = "#89ddff" },
		      ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
		      ObsidianTilde = { bold = true, fg = "#ff5370" },
		      ObsidianBullet = { bold = true, fg = "#89ddff" },
		      ObsidianRefText = { underline = true, fg = "#c792ea" },
		      ObsidianExtLinkIcon = { fg = "#c792ea" },
		      ObsidianTag = { italic = true, fg = "#89ddff" },
		      ObsidianHighlightText = { bg = "#75662e" },
			},
		},
	})
	vim.keymap.set("n", "<leader><leader>n", ":ObsidianQuickSwitch<CR>", {})
--[ obsidian ]--------
end

return M
