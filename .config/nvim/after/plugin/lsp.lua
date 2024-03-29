function Contains(list, x)
	for _, v in pairs(list) do
		if v == x then
			return true
		end
	end
	return false
end

local lsp = require("lsp-zero")
local lspkind = require("lspkind")

local snip_present, luasnip = pcall(require, "luasnip")
if not snip_present then
	return
end

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"lua_ls",
	"eslint",
	"rust_analyzer",
})

-- Fix Undefined global 'vim'
lsp.configure("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lsp.configure("tsserver", {
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = false,
				includeInlayVariableTypeHints = false,
				includeInlayVariableTypeHintsWhenTypeMatchesName = false,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = false,
				includeInlayEnumMemberValueHints = true,
			},
		},
		javascript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = false,
				includeInlayVariableTypeHints = false,
				includeInlayVariableTypeHintsWhenTypeMatchesName = false,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = false,
				includeInlayEnumMemberValueHints = true,
			},
		},
	},
})
local cmp = require("cmp")

lsp.setup_nvim_cmp({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = {
		["<C-e>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<esc>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},
	view = {
		entries = "custom",
	},
	window = {
		completion = {
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			--[[ border = "none", ]]
		},
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = strings[1] .. " "
			kind.menu = "    " .. strings[2]

			return kind
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	experimental = {
		ghost_text = false,
	},
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "",
		warn = "",
		hint = "",
		info = "",
	},
})

local disabled_client_formatters = {
	"tsserver",
}

local function filter(arr, fn)
	if type(arr) ~= "table" then
		return arr
	end

	local filtered = {}
	for k, v in pairs(arr) do
		if fn(v, k, arr) then
			table.insert(filtered, v)
		end
	end

	return filtered
end

local function filterReactDTS(value)
	return string.match(value.filename, "react/index.d.ts") == nil
end

local function on_list(options)
	local items = options.items
	if #items > 1 then
		items = filter(items, filterReactDTS)
	end

	vim.fn.setqflist({}, " ", { title = options.title, items = items, context = options.context })
	vim.api.nvim_command("copen") -- or maybe you want 'copen' instead of 'cfirst'
end

lsp.on_attach(function(client, bufnr)
	local opts = { remap = false, buffer = bufnr }

	vim.keymap.set("n", "gD", function()
		vim.lsp.buf.declaration()
	end, opts)
	vim.keymap.set("n", "gd", function()
		require("telescope.builtin").lsp_definitions()
	end, opts)
	vim.keymap.set("n", "gh", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "gi", function()
		require("telescope.builtin").lsp_implementations()
	end, opts)
	vim.keymap.set("n", "gr", function()
		require("telescope.builtin").lsp_references()
	end, opts)
	vim.keymap.set("n", "<C-y>", function()
		vim.lsp.buf.signature_help()
	end, opts)
	vim.keymap.set("n", "<leader>r", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("n", "<leader>.", "<cmd>CodeActionMenu<CR>", opts)
	vim.keymap.set("n", "gl", function()
		vim.diagnostic.open_float({ border = "single" })
	end, opts)
	vim.keymap.set("n", "<C-q>", function()
		vim.diagnostic.goto_prev({ border = "single" })
	end, opts)
	vim.keymap.set("n", "<C-a>", function()
		vim.diagnostic.goto_next({ border = "single" })
	end, opts)
	vim.keymap.set("n", "<leader>q", function()
		vim.diagnostic.setloclist()
	end, opts)

	vim.api.nvim_create_user_command("Format", function()
		vim.lsp.buf.format({ async = false })
	end, {})

	-- Disable formatting capabilities for specific clients
	if Contains(disabled_client_formatters, client.name) then
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end
end)

lsp.setup()
